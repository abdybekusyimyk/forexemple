// import 'dart:html' as http;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Us {
  Us({required this.status, required this.totalResults});

  final String status;
  final int totalResults;

  factory Us.fromJson(Map<String, dynamic> json) {
    return Us(status: json['status'], totalResults: json['totalResults']);
  }
}

Future<Us?> fetchData() async {
  final Client client = Client();

  final uri = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=adadaa8d08cd4b4aa9b9f366c7554929');

  /// http response
  final Response response = await client.get(uri);

  if (response.statusCode == 200) {
    /// void jaz
    print(response.body);
    print(response.body.runtimeType);

    ///String di MAp otyzy
    final data = jsonDecode(response.body);
    print(data);
    print(data.runtimeType);

    final us = Us.fromJson(data);
    print(us);
    print(us.runtimeType);

    return us;
  } else {
    return null;
  }
}

class Models extends StatefulWidget {
  const Models({Key? key}) : super(key: key);

  @override
  _ModelsState createState() => _ModelsState();
}

class _ModelsState extends State<Models> {
  Us? us;

  Future<void> fetchUs() async {
    us = await fetchData();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchData();
    fetchUs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP'),
      ),
      body: us == null
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Text(us!.status),
                Text(us!.totalResults.toString()),
              ],
            ),
    );
  }
}
