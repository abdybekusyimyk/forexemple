// import 'dart:convert';
// import 'dart:ffi';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

class Todo {
  Todo(
      {required this.title,
      this.decription,
      // required this.isCompleted,
      required this.author});

  final String title;
  final String? decription;
  // final bool isCompleted;
  final String author;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'decription': decription,
      // 'isCompleted': isCompleted,
      'author': author,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      decription: map['decription'],
      // isCompleted: map['isCompleted'],
      author: map['author'],
    );
  }
}
