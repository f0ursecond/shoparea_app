// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/components/button_style/outlined_button_with_icon.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/components/sized_box/horizontal_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/front_store/components/home_title/home_title_text.dart';
import 'package:shoparea_app/screen/front_store/front_store_screen.dart';
import 'package:shoparea_app/screen/informasi_toko/components/product/product_on_informasi_toko.dart';
import 'package:shoparea_app/screen/informasi_toko/components/profile_toko_section.dart';
import 'package:shoparea_app/size_config.dart';

import '../../../components/sized_box/vertical_sized_box.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> dataKetersediaanToko = [
    {"hari": "Senin", "ketersediaan": "Buka"},
    {"hari": "Selasa", "ketersediaan": "Buka"},
    {"hari": "Rabu", "ketersediaan": "Buka"},
    {"hari": "Kamis", "ketersediaan": "Buka"},
    {"hari": "Jumat", "ketersediaan": "Tutup"},
    {"hari": "Sabtu", "ketersediaan": "Tutup"},
    {"hari": "Minggu", "ketersediaan": "Tutup"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kIsWeb
                    ? getWebProportionateScreenWidth(24)
                    : getProportionateScreenWidth(24),
              ),
              child: Column(
                children: [
                  VerticalSizedBox(height: 65),
                  ProfileTokoSection(),
                  VerticalSizedBox(height: 32),
                  HomeTitleText(
                    titleText: "Kategori Produk",
                    txtButton: "Lihat Selengkapnya",
                    titleFontSize: 10,
                    press: () {},
                    btnFontSize: 10,
                  ),
                  ProductOnInformasiScreen(),
                  VerticalSizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: cColorNeutral30, width: 2),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kIsWeb
                  ? getWebProportionateScreenWidth(24)
                  : getProportionateScreenWidth(24),
              vertical: kIsWeb
                  ? getWebProportionateScreenWidth(15)
                  : getProportionateScreenWidth(15),
            ),
            child: Column(
              children: [
                HomeTitleText(
                  titleText: "Ketersediaan Toko",
                  txtButton: "Sekarang Buka",
                  btnFontSize: 12,
                  titleFontSize: 12,
                  press: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
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
                      context: context,
                      builder: (context) {
                        return showBottomSheet();
                      },
                    );
                  },
                ),
                VerticalSizedBox(height: 16),
                PrimaryButton(
                  color: cColorPrimary50,
                  text: "Lihat Produk Toko",
                  textColor: Colors.white,
                  customFontWeight: FontWeight.bold,
                  press: () {
                    Navigator.pushNamed(context, FrontStoreScreen.routeName);
                  },
                  button_width: double.infinity,
                  button_height: 32,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox showBottomSheet() {
    return SizedBox(
      height: kIsWeb
          ? getWebProportionateScreenWidth(435)
          : getProportionateScreenWidth(435),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kIsWeb
              ? getWebProportionateScreenWidth(24)
              : getProportionateScreenWidth(24),
          vertical: kIsWeb
              ? getWebProportionateScreenWidth(16)
              : getProportionateScreenWidth(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset("assets/icons/img_bottom_sheet.svg"),
            ),
            VerticalSizedBox(height: 24),
            CustomText(
              teks: "Ketersediaan Toko",
              fontSize: 12,
              fontWeight: FontWeight.w700,
              teksColor: cColorNeutralBlack50,
            ),
            VerticalSizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataKetersediaanToko.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(
                            bottom: (24),
                          ),
                          child: CustomText(
                            teks:
                                dataKetersediaanToko[index]["hari"].toString(),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            teksColor: cColorExpired50,
                          ));
                    },
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataKetersediaanToko.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: (24),
                        ),
                        child: CustomText(
                          teks: dataKetersediaanToko[index]["ketersediaan"]
                              .toString(),
                          fontSize: 12,
                          textAlign: TextAlign.end,
                          fontWeight: FontWeight.w700,
                          teksColor: dataKetersediaanToko[index]["ketersediaan"]
                                      .toString() ==
                                  "Buka"
                              ? cColorSuccess50
                              : cColorError50,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              height: kIsWeb
                  ? getWebProportionateScreenWidth(60)
                  : getProportionateScreenWidth(60),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: cColorNeutral30,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    teks: "Sekarang",
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    teksColor: cColorNeutralBlack50,
                  ),
                  CustomText(
                    teks: dataKetersediaanToko[0]["ketersediaan"].toString(),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    teksColor:
                        dataKetersediaanToko[0]["ketersediaan"].toString() ==
                                "Buka"
                            ? cColorSuccess50
                            : cColorError50,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
