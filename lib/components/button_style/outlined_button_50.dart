// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/size_config.dart';

class OutlinedButton50 extends StatelessWidget {
  const OutlinedButton50({
    super.key,
    required this.text,
    required this.press,
  });
  final String text;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(131),
      height: getProportionateScreenHeight(48),
      child: OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1, color: cColorPrimary50),
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
            color: cColorPrimary50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
