import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeServices {
  static Future<void> showDateTimePicker(
      BuildContext context, void Function(DateTime) onchanged) {
    return showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.25,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            maximumDate: DateTime(2024),
            onDateTimeChanged: onchanged,
            //  (value) {
            //   // datetime.text = value.toString();
            //   datetime.text = DateFormat("d MMM, y").format(value);
            // },
            initialDateTime: DateTime.now(),
            minimumYear: 2000,
            maximumYear: 2030,
          ),
        );
      },
    );
  }
}
