import 'package:flutter/material.dart';

import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/widgets/gradient_icon.dart';

class ButtomMode extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool isActive;
  final VoidCallback onClick;

  const ButtomMode({
    Key? key,
    required this.iconData,
    required this.title,
    required this.isActive,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onClick,
          child: Ink(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 4,
                    spreadRadius: -0.5,
                    color: Colors.grey.shade300)
              ],
              borderRadius: BorderRadius.circular(16),
              color: isActive ? null : Colors.white,
              gradient: isActive ? AppColors.gradientAccent : null,
            ),
            child: isActive
                ? Icon(
                    iconData,
                    color: Colors.white,
                    size: 23,
                  )
                : GradientIcon(
                    icon: iconData,
                    gradient: AppColors.gradientPrimary,
                    size: 23,
                  ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.textDark : AppColors.textLight,
          ),
        )
      ],
    );
  }
}
