import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/details_screen/components/body.dart';

import '../../../../consts/colors.dart';
import '../../../../size_config.dart';

class TextProductDetailsTitleValue extends StatelessWidget {
  const TextProductDetailsTitleValue({
    Key? key,
    required this.widget,
    required this.title,
    required this.value,
    this.press,
  }) : super(key: key);

  final Body widget;
  final String title, value;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: kIsWeb
                  ? getWebProportionateScreenWidth(14)
                  : getProportionateScreenWidth(14),
              fontWeight: FontWeight.w700,
              color: cColorNeutralBlack50,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: cColorExpired50,
              fontSize: kIsWeb
                  ? getWebProportionateScreenWidth(12)
                  : getProportionateScreenWidth(12),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
