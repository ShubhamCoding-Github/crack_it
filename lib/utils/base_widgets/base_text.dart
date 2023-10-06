import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? topMargin, bottomMargin, leftMargin, rightMargin;
  const BaseText(this.text,
      {super.key,
      this.topMargin,
      this.bottomMargin,
      this.leftMargin,
      this.rightMargin,
      this.fontSize,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: topMargin ?? 0,
          bottom: bottomMargin ?? 0,
          right: rightMargin ?? 0,
          left: leftMargin ?? 0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}

Widget addTextLeft(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(text.tr,
      textScaleFactor: 1,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ));
}
