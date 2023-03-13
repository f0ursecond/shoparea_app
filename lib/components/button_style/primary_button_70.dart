import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/size_config.dart';

class PrimaryButton70 extends StatelessWidget {
  const PrimaryButton70({
    super.key,
    required this.text,
    required this.press,
  });
  final String text;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(48),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            backgroundColor: cColorPrimary70,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(12),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
