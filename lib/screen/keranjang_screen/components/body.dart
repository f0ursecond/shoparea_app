// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shoparea_app/components/button_style/outlined_button_with_icon.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/components/teks/text_field_with_counter.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/front_store/components/contact_banner/contact_banner.dart';
import 'package:shoparea_app/screen/front_store/front_store_screen.dart';
import 'package:shoparea_app/screen/keranjang_screen/components/item_product_keranjang.dart';
import 'package:shoparea_app/screen/pengiriman_screen/pengiriman_screen.dart';

import '../../../models/CartItems.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<Product> cartItems;
  bool isEmptyStateVisible = false;
  bool isListKeranjangVisible = false;

  @override
  void initState() {
    super.initState();
    cartItems = CartModel().getCartItems();
    isEmptyStateVisible = cartItems.isEmpty;
    isListKeranjangVisible = cartItems.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: isEmptyStateVisible,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kIsWeb
                  ? getWebProportionateScreenWidth(24)
                  : getProportionateScreenWidth(24),
            ),
            child: Column(
              children: [
                VerticalSizedBox(height: 100),
                Image.asset("assets/images/iv_bag_cart.png"),
                VerticalSizedBox(height: 32),
                CustomText(
                  teks: "Keranjang Kamu Masih Kosong",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  teksColor: cColorNeutralBlack50,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                VerticalSizedBox(height: 16),
                CustomText(
                  teks:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                  fontSize: 14,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  teksColor: cColorExpired50,
                ),
                VerticalSizedBox(height: 24),
                PrimaryButton(
                  text: "Lihat produk yang tersedia",
                  press: () {
                    Navigator.pushNamed(context, FrontStoreScreen.routeName);
                  },
                  button_width: double.infinity,
                  color: cColorPrimary50,
                  textColor: Colors.white,
                  customFontWeight: FontWeight.w700,
                  button_height: 32,
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isListKeranjangVisible,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kIsWeb
                    ? getWebProportionateScreenWidth(24)
                    : getProportionateScreenWidth(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VerticalSizedBox(height: 24),
                  CustomText(
                    teks: "Keranjang",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    teksColor: cColorNeutralBlack50,
                  ),
                  VerticalSizedBox(height: 20),
                  LinearPercentIndicator(
                    barRadius: const Radius.circular(20.0),
                    lineHeight: kIsWeb
                        ? getWebProportionateScreenWidth(6)
                        : getProportionateScreenWidth(6),
                    percent: 0.33,
                    progressColor: cColorPrimary50,
                    backgroundColor: cColorNeutral50,
                  ),
                  VerticalSizedBox(height: 32),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      Product product = cartItems[index];
                      return ItemProductKeranjang(
                        // Pass product data to the ItemProductKeranjang widget
                        product: product,
                      );
                    },
                  ),
                  VerticalSizedBox(height: 24),
                  OutlinedButtonWithIcon(
                    text: "Tambah Produk",
                    press: () {
                      Navigator.pushNamed(context, FrontStoreScreen.routeName);
                    },
                    button_width: double.infinity,
                    icon: Icons.add,
                    button_height: 32,
                  ),
                  VerticalSizedBox(height: 16),
                  TextFieldWithCounter(
                    teksTitle: "Catatan Untuk Toko",
                    teksHint: "Tambah catatan untuk toko",
                    maxChar: 250,
                  ),
                  ContactBanner(
                    text1: "Ada banyak",
                    text2: "Kupon Nih",
                    bannerWidth: double.infinity,
                    textButton: "Pakai Kupon",
                  ),
                  VerticalSizedBox(height: 24),
                  Row(
                    children: [
                      CustomText(
                        teks: "Nama Pelanggan",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        teksColor: cColorNeutralBlack50,
                      ),
                      CustomText(
                        teks: "*",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        teksColor: cColorError50,
                      ),
                    ],
                  ),
                  VerticalSizedBox(height: 8),
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
                  VerticalSizedBox(height: 16),
                  Row(
                    children: [
                      CustomText(
                        teks: "No.Telp Pelanggan",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        teksColor: cColorNeutralBlack50,
                      ),
                      CustomText(
                        teks: "*",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        teksColor: cColorError50,
                      ),
                    ],
                  ),
                  VerticalSizedBox(height: 8),
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
                      prefixIcon: Image.asset(
                        "assets/images/icon_number_phone.png",
                        width: kIsWeb
                            ? getWebProportionateScreenWidth(12)
                            : getProportionateScreenWidth(12),
                        height: kIsWeb
                            ? getWebProportionateScreenWidth(12)
                            : getProportionateScreenWidth(12),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  VerticalSizedBox(height: 54),
                  PrimaryButton(
                    text: "Lanjut",
                    press: () {
                      Navigator.pushNamed(context, PengirimanScreen.routeName);
                    },
                    button_width: double.infinity,
                    color: cColorPrimary50,
                    textColor: Colors.white,
                    customFontWeight: FontWeight.w700,
                    button_height: 32,
                  ),
                  VerticalSizedBox(height: 24),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
