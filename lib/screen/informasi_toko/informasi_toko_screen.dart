// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoparea_app/screen/informasi_toko/components/body.dart';
import 'package:shoparea_app/size_config.dart';

class InformasiTokoScreen extends StatelessWidget {
  const InformasiTokoScreen({super.key});
  static String routeName = "/informasi_toko";
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informasi Toko",
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
