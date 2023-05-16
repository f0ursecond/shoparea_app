// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';

import '../../../../size_config.dart';

class ContactBanner extends StatelessWidget {
  const ContactBanner({
    Key? key,
    required this.text1,
    required this.text2,
    required this.bannerWidth,
    required this.textButton,
  }) : super(key: key);

  final String text1, text2;
  final double bannerWidth;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kIsWeb
          ? getWebProportionateScreenWidth(78)
          : getProportionateScreenWidth(78),
      width: bannerWidth,
      padding: EdgeInsets.symmetric(
        horizontal: kIsWeb
            ? getWebProportionateScreenWidth(20)
            : getProportionateScreenWidth(20),
      ),
      decoration: BoxDecoration(
        color: cColorPrimary50,
        borderRadius: BorderRadius.circular(
          kIsWeb
              ? getWebProportionateScreenWidth(8)
              : getProportionateScreenWidth(8),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: "$text1\n"),
                  TextSpan(
                    text: text2,
                    style: TextStyle(
                      fontSize: kIsWeb
                          ? getWebProportionateScreenWidth(12)
                          : getProportionateScreenWidth(12),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: PrimaryButton(
              button_width: double.infinity,
              color: Colors.white,
              customFontWeight: FontWeight.bold,
              textColor: cColorPrimary50,
              text: textButton,
              press: () {},
              button_height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
