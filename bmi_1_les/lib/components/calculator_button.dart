import 'dart:developer';

import 'package:bmi_1_les/utils/app_colors.dart';
import 'package:bmi_1_les/utils/app_text.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({Key? key, required this.onTap}) : super(key: key);

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        color: AppColors.buttonColor,
        child: const Center(
          child: Text(
            AppText.calculatorbutton,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
