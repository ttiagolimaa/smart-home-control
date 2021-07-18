import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smarthome/screens/login_screen.dart';
import 'package:smarthome/utils/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xfff9fbfc),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: AppColors.iconColor),
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 25),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.textLight, width: 0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
