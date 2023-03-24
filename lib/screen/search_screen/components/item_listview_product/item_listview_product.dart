// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/utils/currency_formatter.dart';

import '../../../../size_config.dart';

class ItemListProduct extends StatefulWidget {
  final Product? product;
  final Function()? press;

  ItemListProduct({
    super.key,
    this.product,
    this.press,
  });

  @override
  State<ItemListProduct> createState() => _ItemListProductState();
}

class _ItemListProductState extends State<ItemListProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (24),
      ),
      child: Container(
        height: kIsWeb
            ? getWebProportionateScreenWidth(140)
            : getProportionateScreenWidth(140),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: cColorNeutral30, width: 2),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: kIsWeb
                            ? getWebProportionateScreenWidth(24)
                            : getProportionateScreenWidth(24),
                        top: kIsWeb
                            ? getWebProportionateScreenWidth(24)
                            : getProportionateScreenWidth(24),
                        right: kIsWeb
                            ? getWebProportionateScreenWidth(16)
                            : getProportionateScreenWidth(16),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Image.asset(
                          widget.product!.images[0],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.product!.title,
                          style: TextStyle(
                            fontSize: kIsWeb
                                ? getWebProportionateScreenWidth(10)
                                : getProportionateScreenWidth(10),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: kIsWeb
                              ? getWebProportionateScreenWidth(8)
                              : getProportionateScreenWidth(8),
                        ),
                        Text(
                          CurrencyFormat.convertToIdr(widget.product!.price, 0)
                              .toString(),
                          style: TextStyle(
                            fontSize: kIsWeb
                                ? getWebProportionateScreenWidth(12)
                                : getProportionateScreenWidth(12),
                            fontWeight: FontWeight.w700,
                            color: cColorError50,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: PrimaryButton(
                text: "Pilih Item",
                press: () {},
                button_width: kIsWeb
                    ? getWebProportionateScreenWidth(84)
                    : getProportionateScreenWidth(84),
                color: cColorPrimary50,
                textColor: Colors.white,
                customFontWeight: FontWeight.w400,
                button_height: kIsWeb
                    ? getWebProportionateScreenWidth(24)
                    : getProportionateScreenWidth(24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
