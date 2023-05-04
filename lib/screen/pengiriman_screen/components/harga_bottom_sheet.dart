// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/colors.dart';
import '../../../size_config.dart';

class HargaBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(
            kIsWeb
                ? getWebProportionateScreenWidth(24)
                : getProportionateScreenWidth(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset("assets/icons/img_bottom_sheet.svg"),
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(24)
                    : getProportionateScreenWidth(24),
              ),
              Text(
                'Detail Pembayaran',
                style: TextStyle(
                  fontSize: kIsWeb
                      ? getWebProportionateScreenWidth(16)
                      : getProportionateScreenWidth(16),
                  fontWeight: FontWeight.w700,
                  color: cColorNeutralBlack50,
                ),
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(24)
                    : getProportionateScreenWidth(24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Total',
                    style: TextStyle(
                      fontSize: kIsWeb
                          ? getWebProportionateScreenWidth(12)
                          : getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w400,
                      color: cColorExpired50,
                    ),
                  ),
                  Text(
                    'Rp 69.000',
                    style: TextStyle(
                      fontSize: kIsWeb
                          ? getWebProportionateScreenWidth(12)
                          : getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w700,
                      color: cColorNeutralBlack50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(16)
                    : getProportionateScreenWidth(16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Biaya Pengiriman',
                    style: TextStyle(
                      fontSize: kIsWeb
                          ? getWebProportionateScreenWidth(12)
                          : getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w400,
                      color: cColorExpired50,
                    ),
                  ),
                  Text(
                    'Rp -5.000',
                    style: TextStyle(
                      fontSize: kIsWeb
                          ? getWebProportionateScreenWidth(12)
                          : getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w700,
                      color: cColorPrimary50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(16)
                    : getProportionateScreenWidth(16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Biaya Admin',
                        style: TextStyle(
                          fontSize: kIsWeb
                              ? getWebProportionateScreenWidth(12)
                              : getProportionateScreenWidth(12),
                          fontWeight: FontWeight.w400,
                          color: cColorExpired50,
                        ),
                      ),
                      SizedBox(
                        width: kIsWeb
                            ? getWebProportionateScreenWidth(8)
                            : getProportionateScreenWidth(8),
                      ),
                      Icon(
                        Icons.info_outlined,
                        color: cColorNeutral50,
                      )
                    ],
                  ),
                  Text(
                    'Rp -4.000',
                    style: TextStyle(
                      fontSize: kIsWeb
                          ? getWebProportionateScreenWidth(12)
                          : getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w700,
                      color: cColorPrimary50,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
