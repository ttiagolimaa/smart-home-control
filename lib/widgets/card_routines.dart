import 'package:flutter/material.dart';

import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/widgets/gradient_icon.dart';

class CardRoutinesWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool isActive;

  const CardRoutinesWidget({
    Key? key,
    required this.iconData,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
          gradient: isActive ? AppColors.gradientAccent : null,
          color: isActive ? null : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 0.7,
                spreadRadius: -0.5,
                color: Colors.grey.shade600)
          ]),
      margin: EdgeInsets.only(right: 16, bottom: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isActive
                ? Icon(
                    iconData,
                    size: 30,
                    color: Colors.white,
                  )
                : GradientIcon(
                    icon: iconData,
                    size: 30,
                    gradient: AppColors.gradientPrimary,
                  ),
            SizedBox(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: isActive ? Colors.white : AppColors.textLight,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
