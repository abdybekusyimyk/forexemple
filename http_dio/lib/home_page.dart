import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_dio/models/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<News?> fetchData() async {
    final dio = Dio();
    final res = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=ru&apiKey=adadaa8d08cd4b4aa9b9f366c7554929');

    if (res.statusCode == 200) {
      final News news = News(
          status: res.data['status'],
          totalResults: res.data['totalResults'],
          title: res.data['articles'][2]['title'],
          publishedAt: res.data['articles'][6]['publishedAt']);

      return news;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      body: Center(
        child: FutureBuilder(
          future: fetchData(),
          builder: (ctx, sn) {
            if (sn.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(sn.data!.status),
                  Text(sn.data!.totalResults.toString()),
                  Text(sn.data!.title),
                  Text(sn.data!.publishedAt),
                ],
              );
            } else if (sn.hasError) {
              return Text(sn.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
