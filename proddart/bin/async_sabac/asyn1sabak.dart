// requst
// respons

//  1 misal

//  async :  ubakyt alaturgan funsi aa ekenin belgiledik
//  await  : bir funsia butkongo chei kut  (kutyy)
// <> : generics  list aty = <int> [];
// Future :  kelechekten

import 'package:test/test.dart';

void main() async {
  await salanber();
  // final res = await getName();
  // print(res);

  /// bul funsia toluk butkondon kiin bashkaga ot
  // salanber().then((value) => print("matcher"));
  koshtosh();
}

Future<void> salanber() async {
  await Future.delayed(Duration(seconds: 3));
  // Future.delayed(Duration(seconds: 3)).then((value) => print("salam s2"));
  print('Salam s1');
}

void koshtosh() {
  print('Koshbol');
}

// Future<String> getName() async {
//   await Future.delayed(Duration(seconds: 3));
//   return 'Bekturgan';
// }
