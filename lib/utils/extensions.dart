import 'package:flutter/material.dart';

extension BorderPaint on TextStyle {
  TextStyle borderPaint(double size, Color color) => TextStyle(
        fontSize: size,
        fontFamily: fontFamily,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = color,
      );
}

extension FitWidget on Widget {
  Widget fit() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: this,
    );
  }
}

extension SeparatedColumn on Column {
  Column separatedColumn(double height,
      {MainAxisAlignment alignment = MainAxisAlignment.center,
      MainAxisSize size = MainAxisSize.max}) {
    return Column(
      mainAxisSize: size,
      mainAxisAlignment: alignment,
      children: [
        for (int i = 0; i < children.length; i++) ...{
          children[i],
          if (i < children.length - 1)
            SizedBox(
              height: height,
            ),
        }
      ],
    );
  }
}

extension ShaderWidget on Widget {
  Widget shaderOnWidget(Gradient gradient) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return gradient.createShader(rect);
      },
      child: this,
    );
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
