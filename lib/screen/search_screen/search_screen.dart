// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/search_screen/components/body.dart';
import 'package:shoparea_app/size_config.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static String routeName = "/search_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Cari Produk",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
      ),
      body: Body(),
    );
  }
}
