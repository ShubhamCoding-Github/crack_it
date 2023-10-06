import 'package:crack_it_user/utils/base_widgets/base_text.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final Color? btnColor;
  final double? topMargin, bottomMargin, leftMargin, rightMargin;
  final double? btnRadius, btnWith, btnHeight;
  final Function()? onTap;
  final double? fontSize;
  const BaseButton(
      {super.key,
      this.btnColor,
      this.btnRadius,
      this.onTap,
      this.btnWith,
      this.btnHeight,
      required this.title,
      this.topMargin,
      this.bottomMargin,
      this.leftMargin,
      this.rightMargin,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            top: topMargin ?? 0,
            bottom: bottomMargin ?? 0,
            right: rightMargin ?? 0,
            left: leftMargin ?? 0),
        width: btnWith ?? double.infinity,
        alignment: Alignment.center,
        height: btnHeight ?? 65,
        decoration: BoxDecoration(
          color: btnColor ?? primaryColor,
          borderRadius: BorderRadius.circular(btnRadius ?? 10),
        ),
        child: BaseText(
          title,
          fontSize: fontSize ?? fs18,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BaseButtonWithoutBackground extends StatelessWidget {
  final String title;
  final Color? btnColor;
  final double? topMargin, bottomMargin, leftMargin, rightMargin;
  final double? btnRadius, btnWith, btnHeight;
  final Function()? onTap;
  final double? fontSize;
  const BaseButtonWithoutBackground(
      {super.key,
      this.btnColor,
      this.btnRadius,
      this.onTap,
      this.btnWith,
      this.btnHeight,
      required this.title,
      this.topMargin,
      this.bottomMargin,
      this.leftMargin,
      this.rightMargin,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            top: topMargin ?? 0,
            bottom: bottomMargin ?? 0,
            right: rightMargin ?? 0,
            left: leftMargin ?? 0),
        width: btnWith ?? double.infinity,
        alignment: Alignment.center,
        height: btnHeight ?? 65,
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          color: btnColor ?? primaryColor,
          borderRadius: BorderRadius.circular(btnRadius ?? 10),
        ),
        child: BaseText(
          title,
          fontSize: fontSize ?? fs18,
          color: primaryColor,
        ),
      ),
    );
  }
}
