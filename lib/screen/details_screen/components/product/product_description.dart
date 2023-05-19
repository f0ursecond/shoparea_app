import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/details_screen/components/body.dart';

import '../../../../components/sized_box/vertical_sized_box.dart';
import '../../../../consts/colors.dart';
import '../../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.widget,
  });

  final Body widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deskripsi Produk",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: cColorNeutralBlack50,
            fontWeight: FontWeight.w700,
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(14)
                : getProportionateScreenWidth(14),
          ),
        ),
        VerticalSizedBox(height: 16),
        Text(
          widget.product!.description,
          style: TextStyle(
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(14)
                : getProportionateScreenWidth(14),
            fontWeight: FontWeight.w400,
            color: cColorExpired50,
          ),
        ),
      ],
    );
  }
}
