import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

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
