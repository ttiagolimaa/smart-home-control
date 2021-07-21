import 'package:flutter/material.dart';
import 'package:smarthome/screens/room_control_screen.dart';
import 'package:smarthome/utils/app_colors.dart';

import 'card_routines.dart';

class RoutinesList extends StatelessWidget {
  const RoutinesList({
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
                'Routines',
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
          height: 100,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 16),
            children: [
              CardRoutinesWidget(
                iconData: Icons.wb_sunny,
                title: 'Morning',
                isActive: true,
              ),
              CardRoutinesWidget(
                iconData: Icons.shield,
                title: 'I\'m Out',
                isActive: false,
              ),
              CardRoutinesWidget(
                iconData: Icons.home,
                title: 'Back Home',
                isActive: false,
              ),
            ],
          ),
        )
      ],
    );
  }
}
