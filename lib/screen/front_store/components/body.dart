// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/screen/details_screen/detail_screen.dart';
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
  int productsPerPage = 4;

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
                      itemCount: productsPerPage,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.53,
                        mainAxisSpacing: getProportionateScreenWidth(24),
                        crossAxisSpacing: getProportionateScreenWidth(20),
                      ),
                      itemBuilder: (context, index) => ItemProductCard(
                        product: products[index],
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              product: products[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(24),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(24),
                      vertical: getProportionateScreenWidth(8),
                    ),
                    child: PrimaryButton(
                      color: (productsPerPage < products.length)
                          ? cColorPrimary50
                          : Colors.white,
                      customFontWeight: FontWeight.w400,
                      button_width: double.infinity,
                      text: "Lihat lebih banyak",
                      textColor: (productsPerPage < products.length)
                          ? Colors.white
                          : cColorNeutralBlack10,
                      press: nextPage,
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
            child: PrimaryButton(
              button_width: double.infinity,
              color: cColorError50,
              customFontWeight: FontWeight.normal,
              textColor: Colors.white,
              text: "Lihat semua pesanan",
              press: () {},
            ),
          ),
        ],
      ),
    );
  }

  nextPage() {
    if ((productsPerPage) < products.length) {
      int nextPageItem = products.length - productsPerPage;

      if (nextPageItem >= 4) {
        setState(() {
          productsPerPage += 4;
        });
      } else {
        setState(() {
          productsPerPage += nextPageItem;
        });
      }
    }
  }
}
