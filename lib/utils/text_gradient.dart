import 'package:flutter/material.dart';

class TextGradient extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Gradient gradient = LinearGradient(
    colors: [
      // Colors.green,
      // Colors.yellow,
      Color(0xff6e81e3),
      Color(0Xffc26de4),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  TextGradient(
    this.text, {
    Key? key,
    required this.fontSize,
    required this.fontWeight,
    // required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.white,
        ),
      ),
      shaderCallback: (bounds) {
        // final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(
          Rect.fromLTWH(0.0, 0.0, (fontSize / 2) * text.length, fontSize),
        );
      },
    );
  }
}
