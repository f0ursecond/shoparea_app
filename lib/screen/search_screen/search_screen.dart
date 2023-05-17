// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/search_screen/components/body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static String routeName = "/search_screen";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: cColorPrimary50) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: CustomText(
              teks: "Cari Produk",
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
