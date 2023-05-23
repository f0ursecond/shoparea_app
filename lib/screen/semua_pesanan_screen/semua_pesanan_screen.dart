// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/components/sized_box/horizontal_sized_box.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/keranjang_screen/keranjang_screen.dart';
import 'package:shoparea_app/screen/search_screen/search_screen.dart';
import 'package:shoparea_app/screen/semua_pesanan_screen/components/body.dart';

import '../../size_config.dart';

class SemuaPesananScreen extends StatelessWidget {
  const SemuaPesananScreen({super.key});

  static String routeName = "/semua_pesanan";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: cColorPrimary50)),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Semua Pesanan",
              style: TextStyle(
                fontSize: kIsWeb
                    ? getWebProportionateScreenWidth(16)
                    : getProportionateScreenWidth(16),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/ic_search.svg",
                  // By default our  icon color is white
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SearchScreen.routeName);
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/ic_shop_cart.svg",
                  // By default our  icon color is white
                ),
                onPressed: () {
                  Navigator.pushNamed(context, KeranjangScreen.routeName);
                },
              ),
              HorizontalSizedBox(width: 10),
            ],
          ),
          body: Body(),
        ),
      ),
    );
  }
}
