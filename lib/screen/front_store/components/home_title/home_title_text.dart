import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/size_config.dart';

class HomeTitleText extends StatelessWidget {
  const HomeTitleText({
    super.key,
    required this.titleText,
    required this.txtButton,
    required this.press,
  });

  final String titleText, txtButton;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
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
                  fontSize: getProportionateScreenWidth(14)),
            ),
          )
        ],
      ),
    );
  }
}
