// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class VerticalSizedBox extends StatelessWidget {
  final double height;
  VerticalSizedBox({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kIsWeb
          ? getWebProportionateScreenWidth(height)
          : getProportionateScreenWidth(height),
    );
  }
}
