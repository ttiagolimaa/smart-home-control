import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'package:smarthome/utils/app_colors.dart';
import 'package:smarthome/widgets/gradient_icon.dart';
import 'package:smarthome/widgets/gradient_svg.dart';

class IconTabBarGradientIfActive extends StatelessWidget {
  final bool isActive;
  final Gradient gradient;

  IconTabBarGradientIfActive(
    Key? key,
    this.isActive,
    this.gradient,
  ) : super(key: key);

  factory IconTabBarGradientIfActive.svg({
    Key? key,
    required bool isActive,
    required Gradient gradient,
    required SvgPicture svg,
    required BoxConstraints constraints,
  }) = _IconTabBarGradientIfActiveSVG;

  factory IconTabBarGradientIfActive.icon({
    Key? key,
    required bool isActive,
    required IconData icon,
    required double size,
    required Gradient gradient,
  }) = _IconTabBarGradientIfActiveIcon;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _IconTabBarGradientIfActiveSVG extends IconTabBarGradientIfActive {
  final SvgPicture svg;
  final BoxConstraints constraints;

  _IconTabBarGradientIfActiveSVG({
    Key? key,
    required isActive,
    required gradient,
    required this.svg,
    required this.constraints,
  }) : super(key, isActive, gradient);

  @override
  Widget build(BuildContext context) {
    if (isActive)
      return GradientSvg(
        constraints: constraints,
        gradient: gradient,
        svg: svg,
      );
    return svg;
  }
}

class _IconTabBarGradientIfActiveIcon extends IconTabBarGradientIfActive {
  final IconData icon;
  final double size;

  _IconTabBarGradientIfActiveIcon({
    Key? key,
    required bool isActive,
    required this.icon,
    required this.size,
    required Gradient gradient,
  }) : super(key, isActive, gradient);

  @override
  Widget build(BuildContext context) {
    if (isActive)
      return GradientIcon(icon: icon, size: size, gradient: gradient);

    return Icon(
      icon,
      size: size,
    );
  }
}
