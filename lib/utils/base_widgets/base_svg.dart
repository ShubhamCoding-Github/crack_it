import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseSvg extends StatelessWidget {
  final String svgPath;
  final Color? svgColor;
  final double? topMargin, bottomMargin, rightMargin, leftMargin, svgHeight, svgWidth;
  const BaseSvg({super.key, required this.svgPath, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin, this.svgHeight, this.svgWidth, this.svgColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin??0, bottom: bottomMargin??0, right: rightMargin??0, left: leftMargin??0),
      child: SvgPicture.asset(svgPath, height: svgHeight, width: svgWidth, color: svgColor),
    );
  }
}
