// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/outlined_button_50.dart';
import 'package:shoparea_app/components/numeric_step_button.dart';
import 'package:shoparea_app/components/sized_box/horizontal_sized_box.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';

import '../../../models/CartItems.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../../utils/currency_formatter.dart';

class ItemProductKeranjang extends StatefulWidget {
  final Product product; // Add product parameter

  const ItemProductKeranjang({
    Key? key,
    required this.product, // Assign product parameter to a field
  }) : super(key: key);

  @override
  State<ItemProductKeranjang> createState() => _ItemProductKeranjangState();
}

class _ItemProductKeranjangState extends State<ItemProductKeranjang> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        kIsWeb
            ? getWebProportionateScreenWidth(16)
            : getProportionateScreenWidth(16),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: cColorNeutral50),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            // Use product.images[0] instead of "assets/images/sepatu_merah.png"
            widget.product.images[0],
            height: kIsWeb
                ? getWebProportionateScreenWidth(75)
                : getProportionateScreenWidth(75),
            width: kIsWeb
                ? getWebProportionateScreenWidth(75)
                : getProportionateScreenWidth(75),
          ),
          HorizontalSizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                teks: widget.product.title,
                fontSize: 10,
                textOverflow: TextOverflow.ellipsis,
                maxLines: 1,
                fontWeight: FontWeight.w400,
                teksColor: cColorNeutralBlack50,
              ),
              VerticalSizedBox(height: 8),
              CustomText(
                teks: CurrencyFormat.convertToIdr(widget.product.price, 0)
                    .toString(),
                fontSize: 14,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w700,
                teksColor: cColorError50,
              ),
              VerticalSizedBox(height: 8),
              Row(
                children: [
                  CustomText(
                    teks: "Variasi",
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    teksColor: cColorNeutralBlack50,
                  ),
                  HorizontalSizedBox(width: 8),
                  OutlinedButton50(
                    text: "Edit",
                    height: 28,
                    press: () {},
                    width: 55,
                  )
                ],
              ),
              VerticalSizedBox(height: 8),
              CustomText(
                teks: "${widget.product.colors[0]}, ${widget.product.size[0]}",
                fontSize: 8,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w400,
                teksColor: cColorExpired50,
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 65,
            child: NumericStepButton(
              minValue: 0,
              // maxValue: 20,

              onChanged: (value) {
                if (value == 0) {
                  CartModel().removeFromCart(widget.product);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
