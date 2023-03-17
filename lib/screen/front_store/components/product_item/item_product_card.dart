// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/outlined_button_50.dart';
import 'package:shoparea_app/components/numeric_step_button.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/utils/currency_formatter.dart';

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
            child: Column(children: [
              Image.asset(
                widget.product!.images[0],
                fit: BoxFit.fill,
                height: (154),
                width: (154),
              ),
              SizedBox(
                height: (8),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: (12),
                  right: (12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product!.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: (14),
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
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
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: (16),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Visibility(
            visible: isButtonVisible,
            child: OutlinedButton50(
              text: "Beli",
              press: () {
                setState(() {
                  isButtonVisible = !isButtonVisible;
                  isCounterVisible = !isCounterVisible;
                });
              },
            ),
          ),
          Visibility(
            visible: isCounterVisible,
            child: Container(
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
