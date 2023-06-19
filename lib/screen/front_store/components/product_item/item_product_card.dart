// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/outlined_button_50.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/components/numeric_step_button.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/utils/currency_formatter.dart';

import '../../../../size_config.dart';
import '../../../pengiriman_screen/pengiriman_screen.dart';

class ItemProductCard extends StatefulWidget {
  final Product? product;
  final Function()? press;

  const ItemProductCard({
    super.key,
    this.product,
    this.press,
  });

  @override
  State<ItemProductCard> createState() => _ItemProductCardState();
}

class _ItemProductCardState extends State<ItemProductCard> {
  bool isButtonVisible = true;
  late int? counterProduct;

  bool isCounterVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.press,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                widget.product!.images[0],
                fit: BoxFit.fill,
                height: kIsWeb
                    ? getWebProportionateScreenHeight(154)
                    : getProportionateScreenHeight(154),
                width: kIsWeb
                    ? getWebProportionateScreenWidth(154)
                    : getProportionateScreenWidth(154),
              ),
              VerticalSizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(
                  left: kIsWeb
                      ? getWebProportionateScreenWidth(8)
                      : getProportionateScreenWidth(8),
                  right: kIsWeb
                      ? getWebProportionateScreenWidth(8)
                      : getProportionateScreenWidth(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      teks: widget.product!.title,
                      fontSize: 10,
                      teksColor: Colors.black,
                      fontWeight: FontWeight.w400,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    VerticalSizedBox(height: 8),
                    CustomText(
                        teks: CurrencyFormat.convertToIdr(
                                widget.product!.price, 0)
                            .toString(),
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        teksColor: Colors.black),
                    VerticalSizedBox(height: 16),
                  ],
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: kIsWeb
                  ? getWebProportionateScreenWidth(8)
                  : getProportionateScreenWidth(8),
              right: kIsWeb
                  ? getWebProportionateScreenWidth(8)
                  : getProportionateScreenWidth(8),
            ),
            child: Visibility(
              visible: isButtonVisible,
              child: OutlinedButton50(
                width: 131,
                height: 32,
                text: "Beli",
                press: () {
                  setState(() {
                    isButtonVisible = !isButtonVisible;
                    isCounterVisible = !isCounterVisible;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              visible: isCounterVisible,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      child: NumericStepButton(
                        // maxValue: 20,
                        onChanged: (value) {
                          counterProduct = value;
                          setState(() {
                            if (counterProduct == 0) {
                              isCounterVisible = !isCounterVisible;
                              isButtonVisible = !isButtonVisible;
                            }
                          });
                        },
                        counter: 1,
                      ),
                    ),
                    VerticalSizedBox(height: 8),
                    PrimaryButton(
                      text: "Beli",
                      press: () {
                        Navigator.pushNamed(
                          context,
                          PengirimanScreen.routeName,
                          arguments: widget
                              .product, // Pass the 'product' data as an argument
                        );
                      },
                      button_width: 131,
                      color: cColorPrimary50,
                      textColor: Colors.white,
                      customFontWeight: FontWeight.w700,
                      button_height: 32,
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
