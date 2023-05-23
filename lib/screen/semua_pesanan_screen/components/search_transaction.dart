// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import '../../../size_config.dart';

class SearchTransaction extends StatelessWidget {
  const SearchTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kIsWeb
          ? getWebProportionateScreenWidth(84)
          : getProportionateScreenWidth(84),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (24)),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: cColorPrimary10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: cColorNeutral70),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: cColorError50),
              ),
              hintText: 'Mau cari apa?',
              hintStyle: TextStyle(
                color: cColorExpired30,
                fontWeight: FontWeight.w400,
                fontSize: (12),
              ),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
      ),
    );
  }
}
