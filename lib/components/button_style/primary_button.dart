// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.press,
    required this.button_width,
    required this.color,
    required this.textColor,
    required this.customFontWeight,
  });
  final String text;
  final FontWeight customFontWeight;
  final Color textColor;
  final Function()? press;

  final Color color;

  final double button_width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: button_width,
      height: getProportionateScreenHeight(48),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
            color: textColor,
            fontWeight: customFontWeight,
          ),
        ),
      ),
    );
  }
}
