import 'package:flutter/material.dart';
import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/utils/curve_clipper_home.dart';

import 'info_header_home.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CurveClipperHome(),
          child: Container(
            height: size.height * 0.35,
            width: size.width,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(gradient: AppColors.gradientPrimary),
            child: Opacity(
              opacity: 0.07,
              child: Text(
                'Smart Home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 63,
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Lesley\'s Home',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      CircleAvatar(
                          backgroundImage: AssetImage('assets/avatar.jpg')),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 160,
                  child: Stack(
                    children: [
                      Card(
                        elevation: 1,
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InfoHeaderHomeWidget(
                                    title: '24ºC',
                                    description: 'avg house temp'),
                                InfoHeaderHomeWidget(
                                    title: '69%', description: 'humidity'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InfoHeaderHomeWidget(
                                    title: '36ºC',
                                    description: 'avg house temp'),
                                InfoHeaderHomeWidget(
                                    title: '24ºC',
                                    description: 'avg house temp'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Divider(),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Divider(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
