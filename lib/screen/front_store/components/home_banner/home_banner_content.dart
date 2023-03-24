import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

class BannerContent extends StatelessWidget {
  const BannerContent({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          image,
          fit: BoxFit.fill,
          height: kIsWeb
              ? getWebProportionateScreenWidth(157)
              : getProportionateScreenWidth(157),
          width: kIsWeb
              ? getWebProportionateScreenWidth(327)
              : getProportionateScreenWidth(327),
        ),
      ],
    );
  }
}
