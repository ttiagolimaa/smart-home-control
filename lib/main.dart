import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smarthome/screens/home_screen.dart';
import 'package:smarthome/screens/login_screen.dart';

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
        scaffoldBackgroundColor: Color(0xfffafcff),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Color(0xffc9d4e4)),
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 25),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xff5168c5), width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
