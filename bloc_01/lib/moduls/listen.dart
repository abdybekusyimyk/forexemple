// import 'dart:math';

import 'dart:developer';

void main(List<String> args) {
  Stream<int> dataStream() async* {
    for (int i = 1; i <= 8; i++) {
      print("Striem data ${i.toString()}");
      await Future.delayed(Duration(seconds: 2));
      yield i;
    }
  }

  Stream<int> stream = dataStream();

  stream.listen((event) {
    log("RECEIVE data ${event.toString()}");
  });
}
