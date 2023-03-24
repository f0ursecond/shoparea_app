// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/size_config.dart';

class IconBtnWIthCounter extends StatelessWidget {
  const IconBtnWIthCounter({
    Key? key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        kIsWeb
            ? getWebProportionateScreenWidth(80)
            : getProportionateScreenWidth(80),
      ),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: kIsWeb
                ? getWebProportionateScreenWidth(46)
                : getProportionateScreenWidth(46),
            width: kIsWeb
                ? getWebProportionateScreenWidth(46)
                : getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: cColorPrimary50,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              right: 3,
              top: 3,
              child: Container(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(22)
                    : getProportionateScreenWidth(22),
                width: kIsWeb
                    ? getWebProportionateScreenWidth(22)
                    : getProportionateScreenWidth(22),
                decoration: BoxDecoration(
                  color: Color(0xFFEB4755),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: kIsWeb
                          ? getWebProportionateScreenWidth(10)
                          : getProportionateScreenWidth(10),
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
