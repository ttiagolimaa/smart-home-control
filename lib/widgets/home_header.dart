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
                  child: Card(
                    elevation: 1,
                    margin: EdgeInsets.zero,
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 80,
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.4,
                          mainAxisSpacing: 0.4,
                        ),
                        children: [
                          InfoHeaderHomeWidget(
                              title: '24ºC', description: 'avg house temp'),
                          InfoHeaderHomeWidget(
                              title: '69%', description: 'humidity'),
                          InfoHeaderHomeWidget(
                              title: '36ºC', description: 'avg house temp'),
                          InfoHeaderHomeWidget(
                              title: '24ºC', description: 'avg house temp'),
                        ],
                      ),
                    ),
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
