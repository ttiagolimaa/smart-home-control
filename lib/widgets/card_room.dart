import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthome/screens/room_control_screen.dart';
import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/widgets/gradient_icon.dart';

class CardRoomsWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String temp;
  final String humidity;

  const CardRoomsWidget({
    Key? key,
    required this.iconData,
    required this.title,
    required this.temp,
    required this.humidity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  gradient: AppColors.gradientPrimary,
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GradientIcon(
                        icon: FontAwesomeIcons.thermometerHalf,
                        gradient: AppColors.gradientPrimary,
                        size: 20,
                      ),
                      Text(temp),
                      SizedBox(width: 10),
                      GradientIcon(
                        icon: FontAwesomeIcons.tint,
                        size: 20,
                        gradient: AppColors.gradientPrimary,
                      ),
                      Text(humidity),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
