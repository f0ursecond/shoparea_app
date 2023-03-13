// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/error_button_50.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/screen/front_store/components/categories/categories.dart';
import 'package:shoparea_app/screen/front_store/components/contact_banner/contact_banner.dart';
import 'package:shoparea_app/screen/front_store/components/home_banner/home_banner.dart';
import 'package:shoparea_app/screen/front_store/components/home_header/home_header.dart';
import 'package:shoparea_app/screen/front_store/components/home_title/home_title_text.dart';
import 'package:shoparea_app/screen/front_store/components/product_item/item_product_card.dart';
import 'package:shoparea_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: getProportionateScreenWidth(32),
                  ),
                  HomeBanner(),
                  ContactBanner(),
                  HomeTitleText(
                    titleText: "Kategori",
                    txtButton: "Lihat Semua",
                    press: () {},
                  ),
                  Categories(),
                  HomeTitleText(
                    titleText: "Semua Produk",
                    txtButton: "Lihat Semua",
                    press: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(24),
                    ),
                    child: Text(
                      "100 produk",
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(24),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(24),
                    ),
                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      itemCount: products.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.53,
                        mainAxisSpacing: getProportionateScreenWidth(24),
                        crossAxisSpacing: getProportionateScreenWidth(20),
                      ),
                      itemBuilder: (context, index) => ItemProductCard(
                        product: products[index],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(24),
                      vertical: getProportionateScreenWidth(8),
                    ),
                    child: PrimaryButton(
                      text: "Lihat lebih banyak",
                      press: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(24),
              vertical: getProportionateScreenWidth(24),
            ),
            child: ErrorButton50(
              text: "Lihat semua pesanan",
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}
