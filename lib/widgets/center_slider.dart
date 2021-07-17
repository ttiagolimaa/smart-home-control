import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/utils/dotted_gradient.dart';
import 'package:smarthome/widgets/gradient_icon.dart';

class CenterSlider extends StatelessWidget {
  final double percentage;
  const CenterSlider({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DottedGradient(
          child: Transform.rotate(
            angle: (pi / 180) * 274.5,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: DottedBorder(
                radius: Radius.circular(200),
                color: Colors.white,
                borderType: BorderType.RRect,
                dashPattern: [0.5, 30],
                strokeCap: StrokeCap.round,
                strokeWidth: 3,
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 9,
          right: 67,
          child: Container(
            height: 30,
            width: 95,
            color: Theme.of(context).scaffoldBackgroundColor,
            // color: Colors.green,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${percentage.round()}ºC',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 35,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientIcon(
                  icon: FontAwesomeIcons.tint,
                  size: 20,
                  gradient: AppColors.gradientPrimary,
                ),
                SizedBox(width: 3),
                Text(
                  '74%',
                  style: TextStyle(color: AppColors.textLight),
                ),
              ],
            )
          ],
        ),
        Positioned(
          bottom: 0,
          left: 92.5,
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.gradientPrimary,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(23),
              onTap: () {},
              child: Icon(
                Icons.power_settings_new,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 30),
          child: Text(
            '20',
            style: TextStyle(
              color: AppColors.iconColor,
              fontSize: 10,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '15',
                  style: TextStyle(
                    color: AppColors.iconColor,
                    fontSize: 10,
                  ),
                ),
                Text(
                  '25',
                  style: TextStyle(
                    color: AppColors.iconColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
