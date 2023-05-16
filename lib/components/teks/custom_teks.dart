// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class CustomText extends StatelessWidget {
  final String teks;
  final double fontSize;
  final FontWeight fontWeight;
  final Color teksColor;
  int? maxLines;
  TextAlign? textAlign;
  TextOverflow? textOverflow;

  CustomText(
      {super.key,
      required this.teks,
      required this.fontSize,
      required this.fontWeight,
      required this.teksColor,
      this.maxLines,
      this.textAlign,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      teks,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: textOverflow,
      style: TextStyle(
          fontSize: kIsWeb
              ? getWebProportionateScreenWidth(fontSize)
              : getProportionateScreenWidth(fontSize),
          color: teksColor,
          fontWeight: fontWeight),
    );
  }
}
