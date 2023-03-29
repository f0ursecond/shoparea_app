// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/components/button_style/outlined_button_with_icon.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/utils/currency_formatter.dart';

import '../../../size_config.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class Body extends StatefulWidget {
  final Product? product;
  const Body({super.key, this.product});

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
                  children: [
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
                    ImageProduct(widget: widget),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(16)
                          : getProportionateScreenWidth(16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product!.title,
                                style: TextStyle(
                                    fontSize: kIsWeb
                                        ? getWebProportionateScreenWidth(18)
                                        : getProportionateScreenWidth(18),
                                    color: cColorNeutralBlack50,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: kIsWeb
                                    ? getWebProportionateScreenWidth(8)
                                    : getProportionateScreenWidth(8),
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(
                                        widget.product!.price, 0)
                                    .toString(),
                                style: TextStyle(
                                    fontSize: kIsWeb
                                        ? getWebProportionateScreenWidth(24)
                                        : getProportionateScreenWidth(24),
                                    color: cColorError50,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/ic_link.svg",
                            // By default our  icon color is white
                            color: cColorExpired50,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/ic_share.svg",
                            // By default our  icon color is white
                            color: cColorSecondary50,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(32)
                          : getProportionateScreenWidth(32),
                    ),
                    ProductDescription(widget: widget),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(12)
                          : getProportionateScreenWidth(12),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: kIsWeb
                            ? getWebProportionateScreenWidth(24)
                            : getProportionateScreenWidth(24),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: cColorNeutral30),
                          bottom: BorderSide(color: cColorNeutral30),
                        ),
                      ),
                      child: TextProductDetailsTitleValue(
                          widget: widget,
                          title: "Stok : ",
                          value:
                              "(${widget.product!.colors.length.toString()} Warna, ${widget.product!.size.length.toString()} Ukuran)"),
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(16)
                          : getProportionateScreenWidth(16),
                    ),
                    TextProductDetailsTitleValue(
                        widget: widget,
                        title: "Stok : ",
                        value: "${widget.product!.stok.toString()} Item"),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: cColorNeutral30, width: 2),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: kIsWeb
                        ? getWebProportionateScreenWidth(24)
                        : getProportionateScreenWidth(24),
                  ),
                  child: OutlinedButtonWithIcon(
                    text: "Keranjang",
                    button_width: kIsWeb
                        ? getWebProportionateScreenWidth(125)
                        : getProportionateScreenWidth(125),
                    button_height: kIsWeb
                        ? getWebProportionateScreenWidth(32)
                        : getProportionateScreenWidth(32),
                    press: () {},
                    icon: Icons.add,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kIsWeb
                        ? getWebProportionateScreenWidth(24)
                        : getProportionateScreenWidth(24),
                    vertical: kIsWeb
                        ? getWebProportionateScreenWidth(15)
                        : getProportionateScreenWidth(15),
                  ),
                  child: PrimaryButton(
                    color: cColorPrimary50,
                    text: "Beli Sekarang",
                    textColor: Colors.white,
                    customFontWeight: FontWeight.bold,
                    press: () {},
                    button_width: kIsWeb
                        ? getWebProportionateScreenWidth(125)
                        : getProportionateScreenWidth(125),
                    button_height: kIsWeb
                        ? getWebProportionateScreenWidth(32)
                        : getProportionateScreenWidth(32),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.widget,
  });

  final Body widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deskripsi Produk",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: cColorNeutralBlack50,
            fontWeight: FontWeight.w700,
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(14)
                : getProportionateScreenWidth(14),
          ),
        ),
        SizedBox(
          height: kIsWeb
              ? getWebProportionateScreenWidth(16)
              : getProportionateScreenWidth(16),
        ),
        Text(
          widget.product!.description,
          style: TextStyle(
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(14)
                : getProportionateScreenWidth(14),
            fontWeight: FontWeight.w400,
            color: cColorExpired50,
          ),
        ),
      ],
    );
  }
}

class ImageProduct extends StatelessWidget {
  const ImageProduct({
    super.key,
    required this.widget,
  });

  final Body widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        widget.product!.images[0],
        width: (327),
        height: (285),
        fit: BoxFit.fill,
      ),
    );
  }
}

class TextProductDetailsTitleValue extends StatelessWidget {
  const TextProductDetailsTitleValue({
    super.key,
    required this.widget,
    required this.title,
    required this.value,
  });

  final Body widget;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(14)
                : getProportionateScreenWidth(14),
            fontWeight: FontWeight.w700,
            color: cColorNeutralBlack50,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: cColorExpired50,
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(12)
                : getProportionateScreenWidth(12),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
