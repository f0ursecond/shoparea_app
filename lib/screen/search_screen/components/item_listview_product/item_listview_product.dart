// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/size_config.dart';
import 'package:shoparea_app/utils/currency_formatter.dart';

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
        height: (120),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: cColorNeutral30, width: 2),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: (24),
                      top: (24),
                      right: (16),
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
                          fontSize: (12),
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: (8),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(widget.product!.price, 0)
                            .toString(),
                        style: TextStyle(
                          fontSize: (16),
                          fontWeight: FontWeight.w700,
                          color: cColorError50,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            PrimaryButton(
              text: "Pilih Item",
              press: () {},
              button_width: (100),
              color: cColorPrimary50,
              textColor: Colors.white,
              customFontWeight: FontWeight.w600,
              button_height: (32),
            )
          ],
        ),
      ),
    );
  }
}
