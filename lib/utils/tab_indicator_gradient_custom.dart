import 'package:flutter/material.dart';

class UnderlineGradientTabIndicator extends Decoration {
  const UnderlineGradientTabIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
  })  : assert(borderSide != null),
        assert(insets != null);

  final BorderSide borderSide;
  final EdgeInsetsGeometry insets;

  @override
  _UnderlineGradientPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlineGradientPainter(this, onChanged);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }
}

class _UnderlineGradientPainter extends BoxPainter {
  final UnderlineGradientTabIndicator decoration;

  _UnderlineGradientPainter(this.decoration, VoidCallback? onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration
        ._indicatorRectFor(rect, textDirection)
        .deflate(decoration.borderSide.width / 2.0);
    final Paint paint = decoration.borderSide.toPaint()
      ..strokeCap = StrokeCap.square
      ..shader = LinearGradient(colors: [
        Color(0xffc46de2),
        Color(0xff7080e1),
      ]).createShader(indicator);

    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
