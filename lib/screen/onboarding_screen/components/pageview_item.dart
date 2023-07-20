import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/models/Onboarding.dart';
import 'package:shoparea_app/size_config.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          width: kIsWeb
              ? getWebProportionateScreenWidth(200)
              : getProportionateScreenWidth(200),
          height: kIsWeb
              ? getWebProportionateScreenWidth(200)
              : getProportionateScreenWidth(200),
          image: AssetImage(
            content[index].image,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        TitleText(
          title: content[index].title,
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Text(
          textAlign: TextAlign.center,
          content[index].description,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kIsWeb
              ? getWebProportionateScreenHeight(10)
              : getProportionateScreenHeight(10),
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
