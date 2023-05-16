// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';

import '../../size_config.dart';

class OutlinedButton50 extends StatelessWidget {
  const OutlinedButton50({
    super.key,
    required this.text,
    required this.press,
    required this.width,
    required this.height,
  });
  final String text;
  final Function()? press;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb
          ? getWebProportionateScreenWidth(width)
          : getProportionateScreenWidth(width),
      height: kIsWeb
          ? getWebProportionateScreenWidth(height)
          : getProportionateScreenWidth(height),
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
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(12)
                : getProportionateScreenWidth(12),
            color: cColorPrimary50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
