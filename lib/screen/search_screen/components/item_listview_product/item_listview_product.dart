// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
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
    return GestureDetector(
      onTap: widget.press,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kIsWeb
              ? getWebProportionateScreenWidth(24)
              : getProportionateScreenWidth(24),
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
                          CustomText(
                              teks: widget.product!.title,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              teksColor: Colors.black),
                          VerticalSizedBox(height: 8),
                          CustomText(
                            teks: CurrencyFormat.convertToIdr(
                                    widget.product!.price, 0)
                                .toString(),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            teksColor: cColorError50,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
