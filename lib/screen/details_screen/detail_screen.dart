// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/screen/details_screen/components/body.dart';
import 'package:shoparea_app/size_config.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Produk",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
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
          SizedBox(width: getProportionateScreenWidth(20) / 2)
        ],
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
