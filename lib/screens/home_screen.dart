import 'package:flutter/material.dart';
import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/widgets/home_header.dart';
import 'package:smarthome/widgets/icon_tab_bar.dart';
import 'package:smarthome/widgets/recently_devices.dart';
import 'package:smarthome/widgets/rooms_list.dart';
import 'package:smarthome/widgets/routines_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        unselectedItemColor: AppColors.iconColor,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: IconTabBarGradientIfActive.icon(
                isActive: _currentIndex == 0,
                icon: Icons.home,
                size: 30,
                gradient: AppColors.gradientPrimary,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconTabBarGradientIfActive.icon(
                icon: Icons.equalizer,
                isActive: _currentIndex == 1,
                size: 30,
                gradient: AppColors.gradientPrimary,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconTabBarGradientIfActive.icon(
                icon: Icons.notifications,
                isActive: _currentIndex == 2,
                size: 30,
                gradient: AppColors.gradientPrimary,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconTabBarGradientIfActive.icon(
                icon: Icons.settings,
                isActive: _currentIndex == 3,
                size: 30,
                gradient: AppColors.gradientPrimary,
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
