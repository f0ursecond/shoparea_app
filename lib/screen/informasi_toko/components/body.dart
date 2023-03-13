// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenWidth(65),
        ),
        Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/iv_avatar_profile_2.png",
                ),
                radius: getProportionateScreenWidth(100),
              ),
              SizedBox(
                height: getProportionateScreenWidth(16),
              ),
              Text(
                "Toko Sepatu",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(16),
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(8),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/icon_links.svg"),
                  SizedBox(
                    width: getProportionateScreenWidth(8),
                  ),
                  Text(
                    "www.linktoko.com",
                    style: TextStyle(
                      color: cColorSecondary50,
                      fontSize: getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
