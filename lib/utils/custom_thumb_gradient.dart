import 'package:flutter/material.dart';

class CustomSliderThumbCircleGradient extends SliderComponentShape {
  final double thumbRadius;
  final IconData iconData;
  final Gradient gradient;

  const CustomSliderThumbCircleGradient({
    required this.thumbRadius,
    required this.iconData,
    required this.gradient,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.white //Thumb Background Color
      ..style = PaintingStyle.fill
      ..shader = gradient
          .createShader(Rect.fromCircle(center: center, radius: thumbRadius));

    TextSpan span = new TextSpan(
      style: new TextStyle(
        color: Colors.white, //Text Color of Value on Thumb
        fontFamily: iconData.fontFamily,
        package: iconData.fontPackage,
        fontSize: 16,
      ),
      text: String.fromCharCode(iconData.codePoint),
    );

    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();

    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }
}
