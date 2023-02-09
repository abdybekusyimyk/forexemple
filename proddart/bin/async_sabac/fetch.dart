// dio,  http
// 1 dio kochurobuz
// 2 jsonplaceholde  chormdon kiruu

import 'package:dio/dio.dart';

void main() async {
  var dio = Dio();
  final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
  print(response.data);
}
