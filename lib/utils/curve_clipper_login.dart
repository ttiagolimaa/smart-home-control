import 'package:flutter/material.dart';

class CurveClipperLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height * 0.7); //vertical line
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height * 0.75); //quadratic curve
    path.lineTo(size.width, 0); //vertical line

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
