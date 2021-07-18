import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarthome/utils/custom_thumb_gradient_slider.dart';
import 'package:smarthome/utils/custom_tick_mark_slider.dart';
import 'package:smarthome/utils/custom_track_slider.dart';
import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/utils/button_mode.dart';
import 'package:smarthome/utils/custom_tab_indicator_gradient.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarthome/widgets/circular_slider.dart';
import 'package:smarthome/widgets/icon_tab_bar.dart';

enum ActiveMode { cool, heat, fan, auto }

class RoomControlScreen extends StatefulWidget {
  const RoomControlScreen({Key? key}) : super(key: key);
  @override
  _RoomControlScreenState createState() => _RoomControlScreenState();
}

class _RoomControlScreenState extends State<RoomControlScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ActiveMode activeMode = ActiveMode.cool;
  double _sliderValue = 1;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 5);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 120,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: IconButton(
                    iconSize: 30,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.keyboard_backspace,
                      color: AppColors.iconColor,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Living room',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            unselectedLabelColor: AppColors.iconColor,
            indicator: UnderlineGradientTabIndicator(
              borderSide: BorderSide(color: Colors.green, width: 1),
              insets: EdgeInsets.zero,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Tab>[
              Tab(
                child: LayoutBuilder(
                  builder: (context, constraints) => SizedBox(
                    width: 40,
                    child: IconTabBarGradientIfActive.svg(
                      isActive: _tabController.index == 0,
                      svg: SvgPicture.asset(
                        'assets/air-conditioner.svg',
                        color: _tabController.index == 0
                            ? Colors.white
                            : AppColors.iconColor,
                      ),
                      constraints: constraints,
                      gradient: AppColors.gradientPrimary,
                    ),
                  ),
                ),
              ),
              Tab(
                child: SizedBox(
                  width: 40,
                  child: IconTabBarGradientIfActive.icon(
                    icon: FontAwesomeIcons.lightbulb,
                    size: 26,
                    gradient: AppColors.gradientPrimary,
                    isActive: _tabController.index == 1,
                  ),
                ),
              ),
              Tab(
                child: SizedBox(
                  width: 40,
                  child: IconTabBarGradientIfActive.icon(
                    icon: FontAwesomeIcons.seedling,
                    gradient: AppColors.gradientPrimary,
                    size: 26,
                    isActive: _tabController.index == 2,
                  ),
                ),
              ),
              Tab(
                child: SizedBox(
                  width: 40,
                  child: IconTabBarGradientIfActive.icon(
                    icon: FontAwesomeIcons.tv,
                    gradient: AppColors.gradientPrimary,
                    size: 25,
                    isActive: _tabController.index == 3,
                  ),
                ),
              ),
              Tab(
                child: SizedBox(
                  width: 40,
                  child: IconTabBarGradientIfActive.icon(
                    icon: FontAwesomeIcons.volumeUp,
                    gradient: AppColors.gradientPrimary,
                    size: 25,
                    isActive: _tabController.index == 4,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CircularSlider(),
              Container(
                width: 350,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtomMode(
                      iconData: Icons.ac_unit_outlined,
                      title: 'Cool',
                      isActive: activeMode == ActiveMode.cool,
                      onClick: () {
                        setState(() {
                          activeMode = ActiveMode.cool;
                        });
                      },
                    ),
                    ButtomMode(
                      iconData: Icons.wb_sunny_outlined,
                      title: 'Heat',
                      isActive: activeMode == ActiveMode.heat,
                      onClick: () {
                        setState(() {
                          activeMode = ActiveMode.heat;
                        });
                      },
                    ),
                    ButtomMode(
                      iconData: FontAwesomeIcons.fan,
                      title: 'Fan',
                      isActive: activeMode == ActiveMode.fan,
                      onClick: () {
                        setState(() {
                          activeMode = ActiveMode.fan;
                        });
                      },
                    ),
                    ButtomMode(
                      iconData: Icons.hdr_auto_outlined,
                      title: 'Auto',
                      isActive: activeMode == ActiveMode.auto,
                      onClick: () {
                        setState(() {
                          activeMode = ActiveMode.auto;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                // height: 100,
                width: 350,
                margin: EdgeInsets.only(bottom: 24, top: 8),
                // color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Fan Speed',
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 0),
                              activeTrackColor: Color(0xffea5ab8),
                              inactiveTrackColor: AppColors.iconColor,
                              trackShape: CustomRoundedRectSliderTrackShape(
                                  gradient: AppColors.gradientAccent),
                              trackHeight: 3.0,
                              thumbShape: CustomSliderThumbCircleGradient(
                                thumbRadius: 14,
                                iconData: FontAwesomeIcons.fan,
                                gradient: AppColors.gradientPrimary,
                              ),
                              tickMarkShape: CustomRoundSliderTickMarkShape(
                                tickMarkRadius: 7,
                                gradient: AppColors.gradientAccent,
                              ),
                              activeTickMarkColor: Colors.white,
                              inactiveTickMarkColor: AppColors.iconColor,
                            ),
                            child: Slider(
                              value: _sliderValue,
                              min: 1,
                              max: 3,
                              divisions: 2,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _sliderValue = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Low',
                                style: TextStyle(color: AppColors.textLight),
                              ),
                              Text(
                                'Mid',
                                style: TextStyle(color: AppColors.textLight),
                              ),
                              Text(
                                'High',
                                style: TextStyle(color: AppColors.textLight),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
