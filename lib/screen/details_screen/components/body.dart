// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/components/button_style/outlined_button_with_icon.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/utils/currency_formatter.dart';

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
                padding: EdgeInsets.symmetric(horizontal: (24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: (32),
                    ),
                    ImageProduct(widget: widget),
                    SizedBox(
                      height: (24),
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
                                    fontSize: (16),
                                    color: cColorNeutralBlack50,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: (8),
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(
                                        widget.product!.price, 0)
                                    .toString(),
                                style: TextStyle(
                                    fontSize: (20),
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
                      height: (48),
                    ),
                    ProductDescription(widget: widget),
                    SizedBox(
                      height: (20),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: (24),
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
                      height: (24),
                    ),
                    TextProductDetailsTitleValue(
                        widget: widget,
                        title: "Stok : ",
                        value: "${widget.product!.stok.toString()} Item"),
                    SizedBox(
                      height: (32),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (24),
                    vertical: (15),
                  ),
                  child: OutlinedButtonWithIcon(
                    text: "Keranjang",
                    button_width: (138),
                    press: () {},
                    icon: Icons.add,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (24),
                    vertical: (15),
                  ),
                  child: PrimaryButton(
                    color: cColorPrimary50,
                    text: "Beli Sekarang",
                    textColor: Colors.white,
                    customFontWeight: FontWeight.bold,
                    press: () {},
                    button_width: (138),
                    button_height: (48),
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
            fontSize: (16),
          ),
        ),
        SizedBox(
          height: (16),
        ),
        Text(
          widget.product!.description,
          style: TextStyle(
            fontSize: (14),
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
            fontSize: (16),
            fontWeight: FontWeight.w700,
            color: cColorNeutralBlack50,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: cColorExpired50,
            fontSize: (14),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
