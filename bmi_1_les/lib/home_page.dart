// import 'dart:math';
// import 'dart:developer';

import 'dart:developer';
import 'dart:math';

import 'package:bmi_1_les/alert_dialog.dart';
import 'package:bmi_1_les/components/calculator_button.dart';
import 'package:bmi_1_les/components/height.dart';
import 'package:bmi_1_les/components/male_famele.dart';
import 'package:bmi_1_les/components/status_card.dart';
import 'package:bmi_1_les/components/weight_age.dart';
import 'package:bmi_1_les/utils/app_colors.dart';
import 'package:bmi_1_les/utils/app_text.dart';
import 'package:bmi_1_les/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isfemale = false;
  int height = 180;
  int weight = 60;
  int age = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          AppText.appBarTitle,
          style: AppTextStyle.greyTextSytle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  StatusCard(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isfemale = false;
                        });
                      },
                      child: MaleFamele(
                        icon: Icons.male,
                        text: AppText.male,
                        isFemale: !isfemale,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  StatusCard(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isfemale = true;
                        });
                      },
                      child: MaleFamele(
                        icon: Icons.female,
                        text: AppText.female,
                        isFemale: isfemale,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            StatusCard(
                child: Height(
              height: height,
              onChanged: (val) {
                setState(() {
                  height = val.toInt();
                });
              },
            )),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  StatusCard(
                      child: WeightAge(
                    text: AppText.weight,
                    value: weight,
                    add: (c) {
                      setState(() {
                        weight = c;
                      });
                    },
                    remove: (c) {
                      setState(() {
                        weight = c;
                      });
                    },
                  )),
                  const SizedBox(width: 20),
                  StatusCard(
                      child: WeightAge(
                    text: AppText.age,
                    value: age,
                    add: (c) {
                      setState(() {
                        age = c;
                      });
                    },
                    remove: (c) {
                      setState(() {
                        age = c;
                      });
                    },
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CalculatorButton(
        onTap: () {
          // final res = weight / (height / 100 ) * (height / 100);
          final res = weight / pow(height / 100, 2);

          if (res <= 18.4) {
            print('$res siz Aryksyz');
            showMyDialog(context: context, text: 'siz Semizsiz');
          } else if (res >= 18.5 && res <= 24.9) {
            print('$res normasyz');
            showMyDialog(context: context, text: 'siz Semizsiz');
          } else if (res >= 25) {
            print('$res siz Semizsiz');
            showMyDialog(context: context, text: 'siz Semizsiz');
          } else {
            print('$res eseptei albadyk');
            showMyDialog(context: context, text: 'siz Semizsiz');
          }
        },
      ),
    );
  }
}
