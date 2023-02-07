import 'package:bmi_1_les/utils/app_colors.dart';
import 'package:bmi_1_les/utils/text_style.dart';
import 'package:flutter/material.dart';

class WeightAge extends StatelessWidget {
  const WeightAge({
    super.key,
    required this.text,
    required this.value,
    required this.remove,
    required this.add,
  });

  final String text;
  final int value;
  final void Function(int) remove;
  final void Function(int) add;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyle.greyTextSytle,
        ),
        const SizedBox(height: 10),
        Text('$value', style: AppTextStyle.valueStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RemoveAddButton(
              iconData: Icons.remove,
              onPressed: () => remove(value - 1),
            ),
            RemoveAddButton(
              iconData: Icons.add,
              onPressed: () => add(value + 1),
            ),
          ],
        )
      ],
    );
  }
}

class RemoveAddButton extends StatelessWidget {
  const RemoveAddButton({super.key, required this.iconData, this.onPressed});

  final IconData iconData;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.button2Color,
      onPressed: onPressed,
      child: Icon(iconData),
    );
  }
}
