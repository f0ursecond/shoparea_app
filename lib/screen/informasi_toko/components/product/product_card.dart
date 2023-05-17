// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    required this.product,
    this.press,
  }) : super(key: key);

  final double width;
  final Product product;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: (20)),
      child: SizedBox(
        width: (width),
        child: GestureDetector(
          onTap: press,
          child: Stack(
            children: [
              Image.asset(
                product.images[0],
                fit: BoxFit.fill,
                color: cColorNeutral50.withOpacity(0.2),
                colorBlendMode: BlendMode.darken,
              ),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.all(
                    (24),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomText(
                      teks: product.category,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      teksColor: Colors.white,
                    ),
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
