// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/front_store/components/body.dart';
import 'package:shoparea_app/screen/informasi_toko/informasi_toko_screen.dart';
import '../../components/sized_box/horizontal_sized_box.dart';
import '../../components/teks/custom_teks.dart';
import '../keranjang_screen/keranjang_screen.dart';
import '../search_screen/search_screen.dart';

class FrontStoreScreen extends StatelessWidget {
  const FrontStoreScreen({super.key});

  static String routeName = "/front_store";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: cColorPrimary50)),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: CustomText(
                teks: "Toko Sepatu",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                teksColor: Colors.white),
            leading: Padding(
              padding: EdgeInsets.only(left: 24, bottom: 12, top: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, InformasiTokoScreen.routeName);
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/images/iv_avatar.png'),
                ),
              ),
            ),
            actions: [
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
              HorizontalSizedBox(width: 10)
            ],
          ),
          body: Body(),
        ),
      ),
    );
  }
}
