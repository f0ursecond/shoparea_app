// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/pengiriman_screen/components/body.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kIsWeb
            ? getWebProportionateScreenWidth(24)
            : getProportionateScreenWidth(24),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(64)
                    : getProportionateScreenWidth(64),
              ),
              Image.asset(
                "assets/images/iv_clock.png",
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(24)
                    : getProportionateScreenWidth(24),
              ),
              Text(
                "Menunggu Pembayaran",
                style: TextStyle(
                  color: cColorNeutralBlack50,
                  fontWeight: FontWeight.w700,
                  fontSize: kIsWeb
                      ? getWebProportionateScreenWidth(20)
                      : getProportionateScreenWidth(20),
                ),
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(16)
                    : getProportionateScreenWidth(16),
              ),
              Text(
                "Mohon bayar dalam waktu 3 jam dari sekarang",
                style: TextStyle(
                  color: cColorExpired50,
                  fontWeight: FontWeight.w400,
                  fontSize: kIsWeb
                      ? getWebProportionateScreenWidth(14)
                      : getProportionateScreenWidth(14),
                ),
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(24)
                    : getProportionateScreenWidth(24),
              ),
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
                            Text(
                              "Total Pembayaran",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: kIsWeb
                                      ? getWebProportionateScreenWidth(14)
                                      : getProportionateScreenWidth(14),
                                  fontWeight: FontWeight.w400,
                                  color: cColorExpired50),
                            ),
                            SizedBox(
                              height: kIsWeb
                                  ? getWebProportionateScreenWidth(8)
                                  : getProportionateScreenWidth(8),
                            ),
                            Text(
                              "Rp. 18.000",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: kIsWeb
                                      ? getWebProportionateScreenWidth(14)
                                      : getProportionateScreenWidth(14),
                                  fontWeight: FontWeight.w700,
                                  color: cColorNeutralBlack50),
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
                                return MyBottomSheet();
                              },
                            );
                          },
                          button_width: kIsWeb
                              ? getWebProportionateScreenWidth(110)
                              : getProportionateScreenWidth(110),
                          color: cColorNeutral10,
                          textColor: cColorPrimary50,
                          customFontWeight: FontWeight.w700,
                          button_height: kIsWeb
                              ? getWebProportionateScreenWidth(32)
                              : getProportionateScreenWidth(32),
                        )
                      ],
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
                    Text(
                      "Kode Pesanan",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: kIsWeb
                              ? getWebProportionateScreenWidth(14)
                              : getProportionateScreenWidth(14),
                          fontWeight: FontWeight.w400,
                          color: cColorExpired50),
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(4)
                          : getProportionateScreenWidth(4),
                    ),
                    Text(
                      "Rp. xxxxxxxxxxxxxxxxxxxxxxx",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: kIsWeb
                              ? getWebProportionateScreenWidth(14)
                              : getProportionateScreenWidth(14),
                          fontWeight: FontWeight.w700,
                          color: cColorError50),
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
                    Text(
                      "Metode Pembayaran",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: kIsWeb
                              ? getWebProportionateScreenWidth(14)
                              : getProportionateScreenWidth(14),
                          fontWeight: FontWeight.w400,
                          color: cColorNeutralBlack50),
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
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
                          Text(
                            "Bayar Sekarang",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: kIsWeb
                                    ? getWebProportionateScreenWidth(14)
                                    : getProportionateScreenWidth(14),
                                fontWeight: FontWeight.w700,
                                color: cColorNeutralBlack50),
                          ),
                          SizedBox(
                            height: kIsWeb
                                ? getWebProportionateScreenWidth(8)
                                : getProportionateScreenWidth(8),
                          ),
                          Text(
                            "berakhir dalam waktu 2:50 jam",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: kIsWeb
                                    ? getWebProportionateScreenWidth(12)
                                    : getProportionateScreenWidth(12),
                                fontWeight: FontWeight.w400,
                                color: cColorExpired50),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(32)
                    : getProportionateScreenWidth(32),
              ),
              PrimaryButton(
                text: "Bayar Sekarang",
                press: () {},
                button_width: double.infinity,
                color: cColorPrimary50,
                textColor: Colors.white,
                customFontWeight: FontWeight.w700,
                button_height: kIsWeb
                    ? getWebProportionateScreenWidth(32)
                    : getProportionateScreenWidth(32),
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(24)
                    : getProportionateScreenWidth(24),
              ),
              Text(
                "Sudah bayar pesanannya?",
                style: TextStyle(
                  color: cColorExpired50,
                  fontWeight: FontWeight.w400,
                  fontSize: kIsWeb
                      ? getWebProportionateScreenWidth(12)
                      : getProportionateScreenWidth(12),
                ),
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(8)
                    : getProportionateScreenWidth(8),
              ),
              GestureDetector(
                onTap: () => {},
                child: Text(
                  "Refresh Halaman",
                  style: TextStyle(
                    color: cColorPrimary50,
                    fontWeight: FontWeight.w700,
                    fontSize: kIsWeb
                        ? getWebProportionateScreenWidth(12)
                        : getProportionateScreenWidth(12),
                  ),
                ),
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(32)
                    : getProportionateScreenWidth(32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
