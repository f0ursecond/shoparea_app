// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/screen/front_store/front_store_screen.dart';
import 'package:shoparea_app/screen/status_bayar_screen/components/body.dart';

import '../../consts/colors.dart';

class StatusBayarScreen extends StatelessWidget {
  const StatusBayarScreen({super.key});

  static String routeName = "/status_bayar";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: cColorPrimary50) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, FrontStoreScreen.routeName);
              },
            ),
            title: CustomText(
              teks: "Checkout",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              teksColor: Colors.white,
            ),
          ),
          body: Body(),
        ),
      ),
    );
  }
}
