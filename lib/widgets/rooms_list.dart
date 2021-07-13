import 'package:flutter/material.dart';
import 'package:smarthome/utils/app_colors.dart';

import 'card_room.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({
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
                'Rooms',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                  color: AppColors.textLight,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 90,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 16),
            children: [
              CardRoomsWidget(
                iconData: Icons.chair_outlined,
                title: 'Living room',
                temp: '23ºC',
                humidity: '74%',
              ),
              CardRoomsWidget(
                iconData: Icons.shower_outlined,
                title: 'Bathrrom',
                temp: '26ºC',
                humidity: '60%',
              ),
              CardRoomsWidget(
                iconData: Icons.bed_outlined,
                title: 'Bedroom',
                temp: '20ºC',
                humidity: '60%',
              ),
            ],
          ),
        )
      ],
    );
  }
}
