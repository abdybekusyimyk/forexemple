// import 'dart:math';

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherlogic/components/custom_button.dart';
import 'package:weatherlogic/constants/api_const.dart';
import 'package:weatherlogic/constants/app_text.dart';
import 'package:weatherlogic/constants/app_text_style.dart';
import 'package:weatherlogic/models/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> weatherLaction() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied
          // permission == LocationPermission.always &&
          //   permission == LocationPermission.whileInUse
          ) {
        await fetchData();
      }
    } else {
      Position position = await Geolocator.getCurrentPosition();
      print(position.latitude);
      print(position.longitude);
    }
  }

  Future<Weather?>? fetchData() async {
    Future.delayed(Duration(seconds: 3));
    final dio = Dio();
    final res = await dio.get(ApiConst.address);
    if (res.statusCode == 200) {
      final Weather weather = Weather(
          id: res.data['weather'][0]['id'],
          main: res.data['weather'][0]['main'],
          description: res.data['weather'][0]['description'],
          icon: res.data['weather'][0]['icon'],
          //2222222222
          city: res.data['name'],
          temp: res.data['main']['temp'],
          countru: res.data['sys']['country']);

      return weather;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          AppText.appBartitle,
          style: AppTextStyle.appBar,
        ),
      ),
      body: FutureBuilder<Weather?>(
        future: fetchData(),
        builder: (context, sn) {
          if (sn.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (sn.connectionState == ConnectionState.none) {
            return Text('Internete kata bar');
          } else if (sn.connectionState == ConnectionState.done) {
            // iigiliktuu
            if (sn.hasError) {
              return Text('${sn.error}'); // kata ketirip kor
            } else if (sn.hasData) {
              final weather = sn.data!;
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/weather.jpg',
                      ),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          icon: Icons.near_me,
                          onPressed: () async {
                            await weatherLaction();
                          },
                        ),
                        CustomButton(
                          icon: Icons.location_city,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // SizedBox(width: 10),
                        Text(
                          "${(weather.temp - 273.15).floorToDouble()} ",
                          style: TextStyle(fontSize: 96, color: Colors.white),
                        ),
                        Image.network(ApiConst.getIcon(weather.icon, 4))
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${weather.description}".replaceAll(' ', '\n'),
                            style: AppTextStyle.centertext,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          weather.city, // Expanded   FittedBox
                          style: TextStyle(color: Colors.white, fontSize: 90),
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return Text('Belgisiz kata boldu');
            }
          } else {
            return Text('Belgisiz kata boldu');
          }
        },
      ),
      // body: Center(
      //   child: FutureBuilder(
      //     future: fetchData(),
      //     builder: (ctx, sn) {
      //       ///debaag
      //       if (sn.hasData) {
      //         return Column(
      //           children: [
      //             Text(sn.data!.id.toString()),
      //             Text(sn.data!.main),
      //             Text(sn.data!.description),
      //             Text(sn.data!.icon),

      //             ///222222222222
      //             Text(sn.data!.city),
      //             Text(sn.data!.temp.toString()),
      //             Text(sn.data!.countru),
      //           ],
      //         );
      //       } else if (sn.hasError) {
      //         return Text(sn.error.toString());
      //       } else {
      //         return const CircularProgressIndicator();
      //       }
      //       //111111111111111111
      //       // return Text(sn.toString());
      //     },
      //   ),
      // ),
    );
  }
}
