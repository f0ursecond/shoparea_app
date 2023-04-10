// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/keranjang_screen/components/body.dart';
import 'package:shoparea_app/size_config.dart';

class KeranjangScreen extends StatelessWidget {
  const KeranjangScreen({super.key});

  static String routeName = "/keranjang_screen";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: cColorPrimary50) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Checkout",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: kIsWeb
                    ? getWebProportionateScreenWidth(16)
                    : getProportionateScreenWidth(16),
              ),
            ),
          ),
          body: Body(),
        ),
      ),
    );
  }
}
