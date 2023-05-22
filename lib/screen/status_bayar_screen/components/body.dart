// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/pengiriman_screen/components/body.dart';
import 'package:shoparea_app/screen/pengiriman_screen/components/harga_bottom_sheet.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kIsWeb
              ? getWebProportionateScreenWidth(24)
              : getProportionateScreenWidth(24),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSizedBox(height: 64),
              Image.asset(
                "assets/images/iv_clock.png",
                fit: BoxFit.fill,
              ),
              VerticalSizedBox(height: 24),
              CustomText(
                teks: "Menunggu Pembayaran",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                teksColor: cColorNeutralBlack50,
              ),
              VerticalSizedBox(height: 16),
              CustomText(
                teks: "Mohon bayar dalam waktu 3 jam dari sekarang",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                teksColor: cColorExpired50,
              ),
              VerticalSizedBox(height: 24),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: kIsWeb
                      ? getWebProportionateScreenWidth(16)
                      : getProportionateScreenWidth(16),
                  vertical: kIsWeb
                      ? getWebProportionateScreenWidth(24)
                      : getProportionateScreenWidth(24),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: cColorNeutral50),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              teks: "Total Pembayaran",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              teksColor: cColorExpired50,
                            ),
                            VerticalSizedBox(height: 8),
                            CustomText(
                              teks: "Rp. 18.000",
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              teksColor: cColorNeutralBlack50,
                            ),
                          ],
                        ),
                        PrimaryButton(
                          text: "Lihat Detail",
                          press: () {
                            showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              constraints: BoxConstraints(
                                maxWidth: kIsWeb ? 400 : double.infinity,
                              ),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return HargaBottomSheet();
                              },
                            );
                          },
                          button_width: 110,
                          color: cColorNeutral10,
                          textColor: cColorPrimary50,
                          customFontWeight: FontWeight.w700,
                          button_height: 32,
                        )
                      ],
                    ),
                    VerticalSizedBox(height: 24),
                    CustomText(
                      teks: "Kode Pesanan",
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      teksColor: cColorExpired50,
                    ),
                    VerticalSizedBox(height: 8),
                    CustomText(
                      teks: "xxxxxxxxxxxxxx",
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      teksColor: cColorError50,
                    ),
                    VerticalSizedBox(height: 24),
                    CustomText(
                      teks: "Metode Pembayaran",
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      teksColor: cColorExpired50,
                    ),
                    VerticalSizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: kIsWeb
                            ? getWebProportionateScreenWidth(16)
                            : getProportionateScreenWidth(16),
                        vertical: kIsWeb
                            ? getWebProportionateScreenWidth(12)
                            : getProportionateScreenWidth(12),
                      ),
                      decoration: BoxDecoration(
                        color: cColorNeutral50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            teks: "Bayar Sekarang",
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            teksColor: cColorNeutralBlack50,
                          ),
                          VerticalSizedBox(height: 8),
                          CustomText(
                            teks: "berakhir dalam waktu 2:50 jam",
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            teksColor: cColorExpired50,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              VerticalSizedBox(height: 32),
              PrimaryButton(
                text: "Bayar Sekarang",
                press: () {},
                button_width: double.infinity,
                color: cColorPrimary50,
                textColor: Colors.white,
                customFontWeight: FontWeight.w700,
                button_height: 32,
              ),
              VerticalSizedBox(height: 24),
              CustomText(
                teks: "Sudah bayar pesanannya?",
                textOverflow: TextOverflow.ellipsis,
                maxLines: 1,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                teksColor: cColorExpired50,
              ),
              VerticalSizedBox(height: 8),
              GestureDetector(
                onTap: () => {},
                child: CustomText(
                  teks: "Refresh Halaman",
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  teksColor: cColorPrimary50,
                ),
              ),
              VerticalSizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
