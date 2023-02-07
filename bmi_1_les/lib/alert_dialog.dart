import 'package:bmi_1_les/utils/app_text.dart';
import 'package:flutter/material.dart';

Future<void> showMyDialog(
    {required BuildContext context, required String text}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(AppText.appBarTitle),
        content: SingleChildScrollView(
          child: ListBody(
            children: [Text(text)],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Kaira eseptoo'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
