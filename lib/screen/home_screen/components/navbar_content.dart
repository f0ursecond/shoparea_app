import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

class HomeAppBarContent extends StatelessWidget {
  const HomeAppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 24,
        right: 26,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hai\nWahyu Rizky',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              CircleAvatar(
                maxRadius: 28,
                backgroundColor: Colors.grey[200],
              ),
            ],
          ),
          SizedBox(
            height: kIsWeb
                ? getWebProportionateScreenHeight(16)
                : getProportionateScreenHeight(16),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[200],
              letterSpacing: 0.5,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
