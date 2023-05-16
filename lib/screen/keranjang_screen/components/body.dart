// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shoparea_app/components/button_style/outlined_button_with_icon.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/front_store/components/contact_banner/contact_banner.dart';
import 'package:shoparea_app/screen/front_store/front_store_screen.dart';
import 'package:shoparea_app/screen/keranjang_screen/components/item_product_keranjang.dart';
import 'package:shoparea_app/screen/pengiriman_screen/pengiriman_screen.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isEmptyStateVisible = false;
  bool isListKeranjangVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kIsWeb
            ? getWebProportionateScreenWidth(24)
            : getProportionateScreenWidth(24),
      ),
      child: Stack(
        children: [
          Visibility(
            visible: isEmptyStateVisible,
            child: Column(
              children: [
                Image.asset("assets/images/iv_bag_cart.png"),
                Text(
                  "Keranjang Kamu Masih Kosong",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: cColorNeutralBlack50,
                    fontWeight: FontWeight.w700,
                    fontSize: kIsWeb
                        ? getWebProportionateScreenWidth(20)
                        : getProportionateScreenWidth(20),
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: cColorExpired50,
                    fontWeight: FontWeight.w400,
                    fontSize: kIsWeb
                        ? getWebProportionateScreenWidth(14)
                        : getProportionateScreenWidth(14),
                  ),
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenWidth(24)
                      : getProportionateScreenWidth(24),
                ),
                PrimaryButton(
                  text: "Lihat produk yang tersedia",
                  press: () {},
                  button_width: double.infinity,
                  color: cColorPrimary50,
                  textColor: Colors.white,
                  customFontWeight: FontWeight.w700,
                  button_height: kIsWeb
                      ? getWebProportionateScreenWidth(32)
                      : getProportionateScreenWidth(32),
                ),
              ],
            ),
          ),
          Visibility(
            visible: isListKeranjangVisible,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(27)
                          : getProportionateScreenWidth(27),
                    ),
                    Text(
                      "Keranjang",
                      style: TextStyle(
                        fontSize: kIsWeb
                            ? getWebProportionateScreenWidth(14)
                            : getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w700,
                        color: cColorNeutralBlack50,
                      ),
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(20)
                          : getProportionateScreenWidth(20),
                    ),
                    LinearPercentIndicator(
                      barRadius: const Radius.circular(20.0),
                      lineHeight: kIsWeb
                          ? getWebProportionateScreenWidth(6)
                          : getProportionateScreenWidth(6),
                      percent: 0.33,
                      progressColor: cColorPrimary50,
                      backgroundColor: cColorNeutral50,
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(32)
                          : getProportionateScreenWidth(32),
                    ),
                    ItemProductKeranjang(),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(8)
                          : getProportionateScreenWidth(8),
                    ),
                    ItemProductKeranjang(),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
                    OutlinedButtonWithIcon(
                      text: "Tambah Produk",
                      press: () {
                        Navigator.pushNamed(
                            context, FrontStoreScreen.routeName);
                      },
                      button_width: double.infinity,
                      icon: Icons.add,
                      button_height: kIsWeb
                          ? getWebProportionateScreenWidth(32)
                          : getProportionateScreenWidth(32),
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(16)
                          : getProportionateScreenWidth(16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Catatan untuk toko",
                          style: TextStyle(
                              color: cColorNeutralBlack50,
                              fontSize: kIsWeb
                                  ? getWebProportionateScreenWidth(14)
                                  : getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "0/250",
                          style: TextStyle(
                              fontSize: kIsWeb
                                  ? getWebProportionateScreenWidth(12)
                                  : getProportionateScreenWidth(12),
                              color: cColorExpired50,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(8)
                          : getProportionateScreenWidth(8),
                    ),
                    TextField(
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
                        hintText: 'Tambah catatan untuk toko',
                        hintStyle: TextStyle(
                          color: cColorExpired30,
                          fontWeight: FontWeight.w400,
                          fontSize: kIsWeb
                              ? getWebProportionateScreenWidth(12)
                              : getProportionateScreenWidth(12),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
                    ContactBanner(
                      text1: "Ada banyak",
                      text2: "Kupon Nih",
                      bannerWidth: double.infinity,
                      textButton: "Pakai Kupon",
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
                    Row(
                      children: [
                        Text(
                          "Nama Pelanggan",
                          style: TextStyle(
                              color: cColorNeutralBlack50,
                              fontSize: kIsWeb
                                  ? getWebProportionateScreenWidth(14)
                                  : getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              fontSize: kIsWeb
                                  ? getWebProportionateScreenWidth(12)
                                  : getProportionateScreenWidth(12),
                              color: cColorError50,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(8)
                          : getProportionateScreenWidth(8),
                    ),
                    TextField(
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
                        hintText: 'Tulis',
                        hintStyle: TextStyle(
                          color: cColorExpired30,
                          fontWeight: FontWeight.w400,
                          fontSize: kIsWeb
                              ? getWebProportionateScreenWidth(12)
                              : getProportionateScreenWidth(12),
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_2_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(18)
                          : getProportionateScreenWidth(18),
                    ),
                    Row(
                      children: [
                        Text(
                          "No. Telp Pelanggan",
                          style: TextStyle(
                              color: cColorNeutralBlack50,
                              fontSize: kIsWeb
                                  ? getWebProportionateScreenWidth(14)
                                  : getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              fontSize: kIsWeb
                                  ? getWebProportionateScreenWidth(12)
                                  : getProportionateScreenWidth(12),
                              color: cColorError50,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(8)
                          : getProportionateScreenWidth(8),
                    ),
                    TextField(
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
                        hintText: 'Tulis',
                        hintStyle: TextStyle(
                          color: cColorExpired30,
                          fontWeight: FontWeight.w400,
                          fontSize: kIsWeb
                              ? getWebProportionateScreenWidth(12)
                              : getProportionateScreenWidth(12),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(56)
                          : getProportionateScreenWidth(56),
                    ),
                    PrimaryButton(
                      text: "Lanjut",
                      press: () {
                        Navigator.pushNamed(
                            context, PengirimanScreen.routeName);
                      },
                      button_width: double.infinity,
                      color: cColorPrimary50,
                      textColor: Colors.white,
                      customFontWeight: FontWeight.w700,
                      button_height: kIsWeb
                          ? getWebProportionateScreenWidth(32)
                          : getProportionateScreenWidth(32),
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
