import 'package:flutter/material.dart';
import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/widgets/gradient_icon.dart';
import 'package:smarthome/widgets/home_header.dart';
import 'package:smarthome/widgets/recently_devices.dart';
import 'package:smarthome/widgets/rooms_list.dart';
import 'package:smarthome/widgets/routines_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        unselectedItemColor: Color(0xffc9d4e4),
        items: [
          BottomNavigationBarItem(
              icon: GradientIcon(
                icon: Icons.home,
                size: 30,
                gradient: AppColors.gradientPrimary,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.equalizer,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: ''),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(size: size),
            Column(
              children: [
                RoutinesList(size: size),
                SizedBox(height: 16),
                RoomsList(size: size),
                SizedBox(height: 16),
                RecentlyDevices(size: size),
                SizedBox(height: 24),
              ],
            )
          ],
        ),
      ),
    );
  }
}
