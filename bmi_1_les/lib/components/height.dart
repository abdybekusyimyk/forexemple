// import 'package:bmi_1_les/home_page.dart';
import 'package:bmi_1_les/utils/app_colors.dart';
import 'package:bmi_1_les/utils/app_text.dart';
import 'package:bmi_1_les/utils/text_style.dart';
import 'package:flutter/cupertino.dart';

class Height extends StatelessWidget {
  const Height({Key? key, required this.height, this.onChanged})
      : super(key: key);

  final int height;
  final void Function(double)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          AppText.height,
          style: AppTextStyle.greyTextSytle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${height.toInt()}',
              style: TextStyle(fontSize: 60),
            ),
            const Text(
              AppText.cm,
              style: AppTextStyle.cmStyle,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: CupertinoSlider(
                activeColor: AppColors.whiteText, //aktif coloru
                // inactiveColor:AppColors.inactiveColor, //aktif emes coloru
                thumbColor: AppColors.buttonColor, // togoloktun omuu
                value: height.toDouble(),
                max: 300,
                onChanged: onChanged),
          ),
        )
      ],
    );
  }
}
