import 'package:flutter/material.dart';

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
          height: (157),
          width: (327),
        ),
      ],
    );
  }
}
