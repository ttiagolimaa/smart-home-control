import 'package:flutter/material.dart';
import 'package:smarthome/utils/app_colors.dart';

class InfoHeaderHomeWidget extends StatelessWidget {
  final String title;
  final String description;

  const InfoHeaderHomeWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: '$title\n',
            style: TextStyle(
              color: AppColors.textDark,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: '$description',
                style: TextStyle(
                  color: AppColors.textDescription,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              )
            ]),
      ),
    );
  }
}
