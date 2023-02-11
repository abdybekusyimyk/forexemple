// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Jagylyktar {
  Jagylyktar(
      {required this.status,
      required this.totalResults,
      required this.title,
      required this.name});

  final String status;
  final int totalResults;
  final String title;
  final String name;

  factory Jagylyktar.fromJson(Map<String, dynamic> json) {
    return Jagylyktar(
        status: json['status'],
        totalResults: json['totalResults'],
        title: json['title'],
        name: json['name']);
  }

  // factory Jagylyktar.fromMap(Map<String, dynamic> map) {
  //   return Jagylyktar(
  //     status: map['status'] as String,
  //     map['totalResults'] as int,
  //     map['title'] as String,
  //     map['name'] as String,
  //   );
  // }
}
