// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/screen/details_screen/components/body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: cColorPrimary50)),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Detail Produk",
              style: TextStyle(
                fontSize: (16),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/ic_search.svg",
                  // By default our  icon color is white
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/ic_shop_cart.svg",
                  // By default our  icon color is white
                ),
                onPressed: () {},
              ),
              SizedBox(width: (20) / 2)
            ],
          ),
          body: Body(
            product: product,
          ),
        ),
      ),
    );
  }
}
