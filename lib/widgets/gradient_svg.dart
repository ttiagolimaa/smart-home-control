import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GradientSvg extends StatelessWidget {
  final SvgPicture svg;
  final BoxConstraints constraints;
  final Gradient gradient;

  GradientSvg({
    Key? key,
    required this.svg,
    required this.constraints,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: svg,
      shaderCallback: (bounds) {
        final Rect rect =
            Rect.fromLTWH(0.0, 0.0, bounds.width / 1.5, bounds.height / 2);
        return gradient.createShader(rect);
      },
    );
  }
}
