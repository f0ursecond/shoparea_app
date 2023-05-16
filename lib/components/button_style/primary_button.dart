// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.press,
    required this.button_width,
    required this.color,
    required this.textColor,
    required this.customFontWeight,
    required this.button_height,
  });
  final String text;
  final FontWeight customFontWeight;
  final Color textColor;
  final Function()? press;

  final Color color;

  final double button_width, button_height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb
          ? getWebProportionateScreenWidth(button_width)
          : getProportionateScreenWidth(button_width),
      height: kIsWeb
          ? getWebProportionateScreenWidth(button_height)
          : getProportionateScreenWidth(button_height),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          text,
          style: TextStyle(
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(10)
                : getProportionateScreenWidth(10),
            color: textColor,
            fontWeight: customFontWeight,
          ),
        ),
      ),
    );
  }
}
