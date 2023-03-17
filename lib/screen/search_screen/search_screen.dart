// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/search_screen/components/body.dart';
import 'package:shoparea_app/size_config.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static String routeName = "/search_screen";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: cColorPrimary50)),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Cari Produk",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: (16),
              ),
            ),
          ),
          body: Body(),
        ),
      ),
    );
  }
}
