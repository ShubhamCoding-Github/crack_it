import 'package:flutter/material.dart';

class BaseCheckbox extends StatelessWidget {
  final bool value;
  final Function() onChanged;
  final double? topMargin, bottomMargin, leftMargin, rightMargin;
  const BaseCheckbox({super.key, required this.onChanged, required this.value, this.topMargin, this.bottomMargin, this.leftMargin, this.rightMargin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      ///CHECKBOX
        onTap: onChanged,
        child: Container(
            margin: EdgeInsets.only(top: topMargin??0, bottom: bottomMargin??0, right: rightMargin??0, left: leftMargin??0),
            decoration: const BoxDecoration(color: Colors.white),
            child: value ? Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.5, color: Colors.transparent)
              ),
              child: const Icon(
                Icons.check,
                size: 20.0,
                color: Colors.white,
              ),
            ) : Container(
              decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1.5, color: Colors.grey)
            ),
              child: const Icon(
              Icons.check,
              size: 20.0,
              color: Colors.white,
            ),
          )
        ),
    );
  }
}
