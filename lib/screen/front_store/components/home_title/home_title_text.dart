// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';

class HomeTitleText extends StatelessWidget {
  const HomeTitleText({
    super.key,
    required this.titleText,
    required this.txtButton,
    required this.press,
    required this.titleFontSize,
  });

  final String titleText, txtButton;
  final double titleFontSize;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: TextStyle(
              fontSize: (titleFontSize),
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            txtButton,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: cColorPrimary50,
                fontSize: (14)),
          ),
        )
      ],
    );
  }
}
