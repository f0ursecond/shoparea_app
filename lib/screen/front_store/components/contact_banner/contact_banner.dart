// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/white_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/size_config.dart';

class ContactBanner extends StatelessWidget {
  const ContactBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(98),
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(24),
        horizontal: getProportionateScreenWidth(24),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      decoration: BoxDecoration(
        color: cColorPrimary50,
        borderRadius: BorderRadius.circular(8),
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
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: WhiteButton(
              text: "Chat Penjual",
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}
