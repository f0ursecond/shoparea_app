// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';

import '../../../../size_config.dart';

class ContactBanner extends StatelessWidget {
  const ContactBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kIsWeb
          ? getWebProportionateScreenWidth(78)
          : getProportionateScreenWidth(78),
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: kIsWeb
            ? getWebProportionateScreenWidth(24)
            : getProportionateScreenWidth(24),
        horizontal: kIsWeb
            ? getWebProportionateScreenWidth(24)
            : getProportionateScreenWidth(24),
      ),
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
                  TextSpan(text: "Hubungi Toko\n"),
                  TextSpan(
                    text: "Sido Muncul",
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
              text: "Chat Penjual",
              press: () {},
              button_height: kIsWeb
                  ? getWebProportionateScreenWidth(32)
                  : getProportionateScreenWidth(32),
            ),
          ),
        ],
      ),
    );
  }
}
