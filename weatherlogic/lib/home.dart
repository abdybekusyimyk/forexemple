import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weatherlogic/constants/api_const.dart';
import 'package:weatherlogic/models/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///111111111111111
  // Future<dynamic> fetchData() async {
  //   final dio = Dio();
  //   final res = await dio.get(ApiConst.address);
  //   print(res);
  //   return res;
  // }

  //22222222222222222
  // 200 syroo iugiluktuu boldy
  Future<Weather?> fetchData() async {
    final dio = Dio();
    final res = await dio.get(ApiConst.address);
    if (res.statusCode == 200) {
      //1111111111111
      // final Weather weather = res.data['weather'][0];

      //22222222222222
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

    //1111111111
    // print(res);
    // return res;
  }

  /// ekbirinchi chakyryla turgan funksia
  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchData(),
          builder: (ctx, sn) {
            ///debaag
            if (sn.hasData) {
              return Column(
                children: [
                  Text(sn.data!.id.toString()),
                  Text(sn.data!.main),
                  Text(sn.data!.description),
                  Text(sn.data!.icon),

                  ///222222222222
                  Text(sn.data!.city),
                  Text(sn.data!.temp.toString()),
                  Text(sn.data!.countru),
                ],
              );
            } else if (sn.hasError) {
              return Text(sn.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
            //111111111111111111
            // return Text(sn.toString());
          },
        ),
      ),
    );
  }
}
