// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class HorizontalSizedBox extends StatelessWidget {
  final double width;
  HorizontalSizedBox({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb
          ? getWebProportionateScreenWidth(width)
          : getProportionateScreenWidth(width),
    );
  }
}
