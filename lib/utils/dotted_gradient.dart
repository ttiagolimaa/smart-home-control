import 'package:flutter/material.dart';

class DottedGradient extends StatelessWidget {
  final Widget child;
  final Gradient gradient = LinearGradient(
    colors: [
      Color(0xfffc93ab),
      Color(0xff6e81e3),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  DottedGradient({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height),
        );
      },
      child: child,
    );
  }
}
