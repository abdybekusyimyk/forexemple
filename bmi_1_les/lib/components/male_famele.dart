import 'package:bmi_1_les/utils/app_colors.dart';
import 'package:bmi_1_les/utils/text_style.dart';
import 'package:flutter/material.dart';

class MaleFamele extends StatelessWidget {
  const MaleFamele({
    super.key,
    required this.text,
    required this.icon,
    required this.isFemale,
  });

  final String text;
  final IconData icon;
  final bool isFemale;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: !isFemale ? AppColors.button2Color : null,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: AppTextStyle.greyTextSytle,
        ),
      ],
    );
  }
}
