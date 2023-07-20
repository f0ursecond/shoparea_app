import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

class AnalyticsButton extends StatelessWidget {
  const AnalyticsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/total_penjualan/');
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF6DB5CB),
          borderRadius: BorderRadius.circular(8),
        ),
        width: kIsWeb
            ? getWebProportionateScreenWidth(180)
            : getProportionateScreenWidth(180),
        height: kIsWeb
            ? getWebProportionateScreenHeight(53)
            : getProportionateScreenHeight(53),
        child: const Chip(
          shape: StadiumBorder(side: BorderSide(color: Color(0xFF6DB5CB))),
          backgroundColor: Color(0xFF6DB5CB),
          label: Text(
            'Cek Analitik Toko Kamu',
            style: TextStyle(
              color: Colors.white,
              fontSize: kIsWeb ? 12 : 14,
            ),
          ),
          avatar: Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
