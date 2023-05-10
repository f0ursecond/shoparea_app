// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
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
import 'package:shoparea_app/screen/semua_pesanan_screen/semua_pesanan_screen.dart';
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
      child: Center(
        child: SizedBox(
          width: kIsWeb ? 400.0 : double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: kIsWeb
                              ? getWebProportionateScreenWidth(16)
                              : getProportionateScreenWidth(16),
                        ),
                        HomeBanner(),
                        SizedBox(
                          height: kIsWeb
                              ? getWebProportionateScreenWidth(24)
                              : getProportionateScreenWidth(24),
                        ),
                        ContactBanner(
                            text1: "Hubungi Toko",
                            text2: "Sido Muncul",
                            textButton: "Chat Penjual",
                            bannerWidth: double.infinity),
                        SizedBox(
                          height: kIsWeb
                              ? getWebProportionateScreenWidth(24)
                              : getProportionateScreenWidth(24),
                        ),
                        HomeTitleText(
                          titleFontSize: kIsWeb
                              ? getWebProportionateScreenWidth(12)
                              : getProportionateScreenWidth(12),
                          titleText: "Kategori",
                          txtButton: "Lihat Semua",
                          press: () {},
                          btnFontSize: kIsWeb
                              ? getWebProportionateScreenWidth(10)
                              : getProportionateScreenWidth(10),
                        ),
                        Categories(),
                        HomeTitleText(
                          titleText: "Semua Produk",
                          txtButton: "Lihat Semua",
                          titleFontSize: kIsWeb
                              ? getWebProportionateScreenWidth(12)
                              : getProportionateScreenWidth(12),
                          press: () {},
                          btnFontSize: kIsWeb
                              ? getWebProportionateScreenWidth(10)
                              : getProportionateScreenWidth(10),
                        ),
                        Text(
                          "100 produk",
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: kIsWeb
                              ? getWebProportionateScreenWidth(24)
                              : getProportionateScreenWidth(24),
                        ),
                        GridView.builder(
                          physics: ScrollPhysics(),
                          itemCount: productsPerPage,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 275,
                            crossAxisCount: 2,
                            childAspectRatio: kIsWeb
                                ? getWebProportionateScreenHeight(0.55)
                                : getProportionateScreenWidth(0.55),
                            mainAxisSpacing: kIsWeb
                                ? getWebProportionateScreenWidth(24)
                                : getProportionateScreenWidth(24),
                            crossAxisSpacing: kIsWeb
                                ? getWebProportionateScreenWidth(20)
                                : getProportionateScreenWidth(20),
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
                        SizedBox(
                          height: kIsWeb
                              ? getWebProportionateScreenWidth(24)
                              : getProportionateScreenWidth(24),
                        ),
                        PrimaryButton(
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
                          button_height: kIsWeb
                              ? getWebProportionateScreenWidth(32)
                              : getProportionateScreenWidth(32),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kIsWeb
                      ? getWebProportionateScreenWidth(24)
                      : getProportionateScreenWidth(24),
                  vertical: kIsWeb
                      ? getWebProportionateScreenWidth(12)
                      : getProportionateScreenWidth(12),
                ),
                child: PrimaryButton(
                  button_width: double.infinity,
                  color: cColorError50,
                  customFontWeight: FontWeight.normal,
                  textColor: Colors.white,
                  text: "Lihat semua pesanan",
                  press: () {
                    Navigator.pushNamed(context, SemuaPesananScreen.routeName);
                  },
                  button_height: kIsWeb
                      ? getWebProportionateScreenWidth(32)
                      : getProportionateScreenWidth(32),
                ),
              ),
            ],
          ),
        ),
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
