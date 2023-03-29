// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/components/button_style/outlined_button_with_icon.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/front_store/components/home_title/home_title_text.dart';
import 'package:shoparea_app/screen/informasi_toko/components/product/product_on_informasi_toko.dart';
import 'package:shoparea_app/size_config.dart';

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
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(65)
                        : getProportionateScreenWidth(65),
                  ),
                  ProfileTokoSection(),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(52)
                        : getProportionateScreenWidth(52),
                  ),
                  HomeTitleText(
                    titleText: "Kategori Produk",
                    txtButton: "Lihat Selengkapnya",
                    titleFontSize: kIsWeb
                        ? getWebProportionateScreenWidth(12)
                        : getProportionateScreenWidth(12),
                    press: () {},
                    btnFontSize: kIsWeb
                        ? getWebProportionateScreenWidth(10)
                        : getProportionateScreenWidth(10),
                  ),
                  ProductOnInformasiScreen(),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(16)
                        : getProportionateScreenWidth(16),
                  ),
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
                  btnFontSize: kIsWeb
                      ? getWebProportionateScreenWidth(14)
                      : getProportionateScreenWidth(14),
                  titleFontSize: kIsWeb
                      ? getWebProportionateScreenWidth(14)
                      : getProportionateScreenWidth(14),
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
                        return SizedBox(
                          height: kIsWeb
                              ? getWebProportionateScreenWidth(480)
                              : getProportionateScreenWidth(480),
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
                                  child: SvgPicture.asset(
                                      "assets/icons/img_bottom_sheet.svg"),
                                ),
                                SizedBox(
                                  height: kIsWeb
                                      ? getWebProportionateScreenWidth(24)
                                      : getProportionateScreenWidth(24),
                                ),
                                Text(
                                  "Ketersediaan Toko",
                                  style: TextStyle(
                                    fontSize: kIsWeb
                                        ? getWebProportionateScreenWidth(12)
                                        : getProportionateScreenWidth(12),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            child: Text(
                                              dataKetersediaanToko[index]
                                                      ["hari"]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: kIsWeb
                                                      ? getWebProportionateScreenWidth(
                                                          12)
                                                      : getProportionateScreenWidth(
                                                          12),
                                                  fontWeight: FontWeight.w400,
                                                  color: cColorExpired50),
                                            ),
                                          );
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
                                            child: Text(
                                              dataKetersediaanToko[index]
                                                      ["ketersediaan"]
                                                  .toString(),
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: kIsWeb
                                                      ? getWebProportionateScreenWidth(
                                                          12)
                                                      : getProportionateScreenWidth(
                                                          12),
                                                  fontWeight: FontWeight.w700,
                                                  color: dataKetersediaanToko[
                                                                      index][
                                                                  "ketersediaan"]
                                                              .toString() ==
                                                          "Buka"
                                                      ? cColorSuccess50
                                                      : cColorError50),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sekarang",
                                        style: TextStyle(
                                          fontSize: kIsWeb
                                              ? getWebProportionateScreenWidth(
                                                  12)
                                              : getProportionateScreenWidth(12),
                                          fontWeight: FontWeight.w700,
                                          color: cColorNeutralBlack50,
                                        ),
                                      ),
                                      Text(
                                        dataKetersediaanToko[0]["ketersediaan"]
                                            .toString(),
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: kIsWeb
                                              ? getWebProportionateScreenWidth(
                                                  12)
                                              : getProportionateScreenWidth(12),
                                          fontWeight: FontWeight.w700,
                                          color: dataKetersediaanToko[0]
                                                          ["ketersediaan"]
                                                      .toString() ==
                                                  "Buka"
                                              ? cColorSuccess50
                                              : cColorError50,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenWidth(16)
                      : getProportionateScreenWidth(16),
                ),
                PrimaryButton(
                  color: cColorPrimary50,
                  text: "Lihat Produk Toko",
                  textColor: Colors.white,
                  customFontWeight: FontWeight.bold,
                  press: () {},
                  button_width: double.infinity,
                  button_height: kIsWeb
                      ? getWebProportionateScreenWidth(32)
                      : getProportionateScreenWidth(32),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileTokoSection extends StatelessWidget {
  const ProfileTokoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/iv_avatar_profile_2.png",
            ),
            radius: (100),
          ),
          SizedBox(
            height: (16),
          ),
          Text(
            "Toko Sepatu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: (16),
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: (8),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/icon_links.svg"),
              SizedBox(
                width: (8),
              ),
              Text(
                "www.linktoko.com",
                style: TextStyle(
                  color: cColorSecondary50,
                  fontSize: (12),
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          SizedBox(
            height: (8),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/ic_shop_address.svg"),
              SizedBox(
                width: (8),
              ),
              Flexible(
                child: Text(
                  "Jl R Agil Kusumadya, Bulusan, Tembalang, Semarang, Jawa Tengah, Indonesia",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    color: cColorExpired50,
                    fontSize: (12),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
