// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_dio/http/janylyktar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  get client => null;

  // fetchData() {
  //   return Jagylyktar(
  //       status:[ 'status'], totalResults: totalResults, title: title, name: name);
  // }
  Future<Jagylyktar?> fetchJanylyktar() async {
    final uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=ru&apiKey=adadaa8d08cd4b4aa9b9f366c7554929');

    final response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final topNews = Jagylyktar.fromJson(data);
      return topNews;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchJanylyktar(),
        builder: (ctx, sn) {
          if (sn.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(sn.data!.status),
              ],
            );
          } else if (sn.hasError) {
            return Text(sn.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
