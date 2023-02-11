import 'package:bloc/bloc.dart';
import 'package:bloc_01/app.dart';
import 'package:bloc_01/counter_observer.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_counter/app.dart';
// import 'package:flutter_counter/counter_observer.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
