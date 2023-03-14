// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/size_config.dart';

class OutlinedButtonWithIcon extends StatelessWidget {
  const OutlinedButtonWithIcon({
    super.key,
    required this.text,
    required this.press,
    required this.button_width,
    required this.icon,
  });
  final String text;
  final Function()? press;

  final double button_width;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: button_width,
      height: getProportionateScreenHeight(48),
      child: OutlinedButton.icon(
        // <-- OutlinedButton
        onPressed: press,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1,
            color: cColorPrimary50,
          ),
        ),
        icon: Icon(
          icon,
          color: cColorPrimary50,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: cColorPrimary50,
            fontWeight: FontWeight.w700,
            fontSize: getProportionateScreenWidth(14),
          ),
        ),
      ),
    );
  }
}
