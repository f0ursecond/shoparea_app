// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/informasi_toko/components/body.dart';

class InformasiTokoScreen extends StatelessWidget {
  const InformasiTokoScreen({super.key});
  static String routeName = "/informasi_toko";
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Center(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: cColorPrimary50)),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Informasi Toko",
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
