import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final String? labelText;
  final Widget? suffix;
  final Color? fillColor;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final double? topMargin, bottomMargin, leftMargin, rightMargin;
  final bool obscureText;
  final double? radius;
  final String? hintText;
  final int? maxLines;
  final bool readOnly;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  const BaseTextField({
    super.key,
    this.labelText,
    this.topMargin,
    this.bottomMargin,
    this.leftMargin,
    this.rightMargin,
    this.suffix,
    this.textInputType,
    this.hintText,
    this.radius,
    this.maxLines = 1,
    this.fillColor,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: topMargin ?? 0,
          bottom: bottomMargin ?? 0,
          right: rightMargin ?? 0,
          left: leftMargin ?? 0),
      child: TextFormField(
        maxLines: maxLines,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: (value){
         onChanged!(value);
        },
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
            borderSide: BorderSide(color: borderGrayColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
            borderSide: const BorderSide(color: borderGrayColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
            borderSide: const BorderSide(color: borderGrayColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(color: Colors.grey),
          suffixIcon: suffix,
        ),
        keyboardType: textInputType,
      ),
    );
  }
}
