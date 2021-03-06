import 'package:flutter/material.dart';
import 'package:smarthome/screens/room_control_screen.dart';
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
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return RoomControlScreen();
                },
              ),
            );
          },
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
                      icon: iconData,
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
      ),
    );
  }
}
