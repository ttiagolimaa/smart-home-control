import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Gradient gradient;

  GradientIcon({
    required this.icon,
    required this.size,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: Container(
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (bounds) {
        final Rect rect = Rect.fromLTWH(
            bounds.left, bounds.top, bounds.width * 0.6, bounds.height * 0.6);
        return gradient.createShader(rect);
      },
    );
  }
}
