import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/utils/text_gradient.dart';

import 'center_slider.dart';

class CircularSlider extends StatefulWidget {
  const CircularSlider({Key? key}) : super(key: key);

  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  int myTemp = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (myTemp == 10) return;
                  myTemp -= 1;
                });
              },
              child: TextGradient(
                '-',
                fontSize: 50,
                fontWeight: FontWeight.w300,
                // gradient: AppColors.gradientPrimary,
              ),
            ),
            SleekCircularSlider(
              onChange: (value) {
                if (value == myTemp) return;
                setState(() {
                  myTemp = value.round();
                });
              },
              innerWidget: (percentage) => CenterSlider(
                percentage: percentage,
              ),
              appearance: CircularSliderAppearance(
                size: 230,
                angleRange: 280,
                startAngle: 130,
                customColors: CustomSliderColors(
                    trackColor: AppColors.iconColor,
                    dotColor: Color(0xff7f7de1),
                    hideShadow: true,
                    progressBarColors: [
                      Color(0xfffc93ab),
                      Color(0xffea5ab8),
                    ]),
                customWidths: CustomSliderWidths(
                  trackWidth: 10,
                  progressBarWidth: 10,
                  handlerSize: 12,
                ),
              ),
              min: 10,
              max: 30,
              initialValue: myTemp.toDouble(),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (myTemp == 30) return;

                  myTemp += 1;
                });
              },
              child: TextGradient(
                '+',
                fontSize: 50,
                fontWeight: FontWeight.w200,
                // gradient: AppColors.gradientPrimary,
              ),
            ),
          ],
        ),
        SizedBox(height: 22),
        Text(
          'Click to turn off',
          style: TextStyle(color: AppColors.textLight),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Divider(),
      ],
    );
  }
}
