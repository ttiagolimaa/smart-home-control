import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/widgets/card_login_widget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.7,
            child: Image.asset(
              'assets/roomtv.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Opacity(
            opacity: 0.8,
            child: Container(
              height: size.height * 0.7,
              decoration: BoxDecoration(gradient: AppColors.gradientPrimary),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Text(
                        'Home.\nSmart Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    CardLoginWidget(size: size),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
