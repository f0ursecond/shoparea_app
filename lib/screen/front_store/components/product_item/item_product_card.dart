import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/outlined_button_50.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/size_config.dart';
import 'package:shoparea_app/utils/currency_formatter.dart';

class ItemProductCard extends StatelessWidget {
  final Product? product;
  final Function()? press;
  const ItemProductCard({super.key, this.product, this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(children: [
        Image.asset(
          product!.images[0],
          fit: BoxFit.fill,
          height: getProportionateScreenWidth(154),
          width: getProportionateScreenWidth(154),
        ),
        SizedBox(
          height: getProportionateScreenWidth(8),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(12),
            right: getProportionateScreenWidth(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product!.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(8),
              ),
              Text(
                CurrencyFormat.convertToIdr(product!.price, 0).toString(),
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(16),
              ),
              OutlinedButton50(
                text: "Beli",
                press: () {},
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
