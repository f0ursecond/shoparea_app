// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';

class ContactBanner extends StatelessWidget {
  const ContactBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (98),
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: (24),
        horizontal: (24),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: (20),
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
                      fontSize: (18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: PrimaryButton(
              button_width: double.infinity,
              color: Colors.white,
              customFontWeight: FontWeight.bold,
              textColor: cColorPrimary50,
              text: "Chat Penjual",
              press: () {},
              button_height: (48),
            ),
          ),
        ],
      ),
    );
  }
}
