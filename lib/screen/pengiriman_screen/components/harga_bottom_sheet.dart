// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoparea_app/components/sized_box/horizontal_sized_box.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';

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
              VerticalSizedBox(height: 24),
              CustomText(
                teks: "Detail Pembayaran",
                fontSize: 16,
                fontWeight: FontWeight.w700,
                teksColor: cColorNeutralBlack50,
              ),
              VerticalSizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    teks: "Sub Total",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    teksColor: cColorExpired50,
                  ),
                  CustomText(
                    teks: "Rp 69.000",
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    teksColor: cColorNeutralBlack50,
                  ),
                ],
              ),
              VerticalSizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    teks: "Biaya Pengiriman",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    teksColor: cColorExpired50,
                  ),
                  CustomText(
                    teks: "Rp -5.000",
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    teksColor: cColorPrimary50,
                  ),
                ],
              ),
              VerticalSizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomText(
                        teks: "Biaya Admin",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        teksColor: cColorExpired50,
                      ),
                      HorizontalSizedBox(width: 8),
                      Icon(
                        Icons.info_outlined,
                        color: cColorNeutral50,
                      )
                    ],
                  ),
                  CustomText(
                    teks: "Rp -4.000",
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    teksColor: cColorPrimary50,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
