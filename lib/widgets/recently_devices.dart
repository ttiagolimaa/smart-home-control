import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthome/screens/room_control_screen.dart';
import 'package:smarthome/utils/app_colors.dart';

import 'card_recently.dart';

class RecentlyDevices extends StatelessWidget {
  const RecentlyDevices({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recently used Devices',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return RoomControlScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: AppColors.textLight,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 113,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 16),
            children: [
              CardRecentlyWidget(
                iconData: Icons.chair_outlined,
                secondaryIconData: Icons.electrical_services_outlined,
                title: 'Living room',
                device: 'HVAC',
              ),
              CardRecentlyWidget(
                iconData: FontAwesomeIcons.lightbulb,
                title: 'Bedroom',
                device: 'Smooth lights',
              ),
              CardRecentlyWidget(
                iconData: Icons.tv,
                title: 'Living room',
                device: 'Tv',
              ),
            ],
          ),
        )
      ],
    );
  }
}
