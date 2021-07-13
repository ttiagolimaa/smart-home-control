import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/widgets/gradient_icon.dart';

class CardRecentlyWidget extends StatelessWidget {
  final IconData iconData;
  final IconData? secondaryIconData;
  final String title;
  final String device;

  const CardRecentlyWidget({
    Key? key,
    required this.iconData,
    required this.title,
    required this.device,
    this.secondaryIconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      child: Card(
        margin: EdgeInsets.only(right: 16, bottom: 4),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientIcon(
                    icon: Icons.air,
                    size: 25,
                    gradient: AppColors.gradientPrimary,
                  ),
                  secondaryIconData != null
                      ? GradientIcon(
                          icon: secondaryIconData!,
                          size: 25,
                          gradient: AppColors.gradientPrimary,
                        )
                      : Container()
                ],
              ),
              SizedBox(height: 4),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                device,
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
