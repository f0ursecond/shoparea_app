// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/front_store/components/home_header/icon_btn_with_counter.dart';
import 'package:shoparea_app/screen/informasi_toko/informasi_toko_screen.dart';
import 'package:shoparea_app/screen/keranjang_screen/keranjang_screen.dart';
import 'package:shoparea_app/screen/search_screen/search_screen.dart';
import 'package:shoparea_app/size_config.dart';

import '../../../../components/sized_box/horizontal_sized_box.dart';
import '../../../../components/teks/custom_teks.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kIsWeb
          ? getWebProportionateScreenWidth(76)
          : getProportionateScreenWidth(76),
      decoration: BoxDecoration(
        color: cColorPrimary50,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 5.0),
            blurRadius: 4.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kIsWeb
              ? getWebProportionateScreenWidth(24)
              : getProportionateScreenWidth(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(50)
                    : getProportionateScreenWidth(50),
                color: cColorPrimary50,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, InformasiTokoScreen.routeName);
                      },
                      child: CircleAvatar(
                        maxRadius: kIsWeb
                            ? getWebProportionateScreenWidth(16)
                            : getProportionateScreenWidth(16),
                        backgroundImage:
                            AssetImage('assets/images/iv_avatar.png'),
                      ),
                    ),
                    HorizontalSizedBox(width: 8),
                    CustomText(
                      teks: "Toko Sepatu",
                      fontSize: 14,
                      teksColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
            IconBtnWIthCounter(
              svgSrc: "assets/icons/ic_search.svg",
              press: () {
                Navigator.pushNamed(context, SearchScreen.routeName);
              },
            ),
            IconBtnWIthCounter(
              svgSrc: "assets/icons/ic_shop_cart.svg",
              numOfitem: 3,
              press: () {
                Navigator.pushNamed(context, KeranjangScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
