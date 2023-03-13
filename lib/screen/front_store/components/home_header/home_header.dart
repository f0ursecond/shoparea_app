// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/front_store/components/home_header/icon_btn_with_counter.dart';
import 'package:shoparea_app/screen/informasi_toko/informasi_toko_screen.dart';
import 'package:shoparea_app/size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(76),
      decoration: BoxDecoration(
        color: cColorPrimary50,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 15.0,
          ),
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.6,
              height: getProportionateScreenWidth(50),
              color: cColorPrimary50,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, InformasiTokoScreen.routeName);
                    },
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/iv_avatar.png'),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Text(
                    "Toko Sepatu",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            IconBtnWIthCounter(
              svgSrc: "assets/icons/ic_search.svg",
              press: () {},
            ),
            IconBtnWIthCounter(
              svgSrc: "assets/icons/ic_shop_cart.svg",
              numOfitem: 4,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
