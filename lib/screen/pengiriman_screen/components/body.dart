// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/status_bayar_screen/status_bayar_screen.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isSelected = false;
  int selectedItemIndex = -1; // -1 artinya tidak ada yang dipilih

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kIsWeb
                  ? getWebProportionateScreenWidth(24)
                  : getProportionateScreenWidth(24),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(27)
                        : getProportionateScreenWidth(27),
                  ),
                  Center(
                    child: Text(
                      "Pengiriman",
                      style: TextStyle(
                        fontSize: kIsWeb
                            ? getWebProportionateScreenWidth(14)
                            : getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w700,
                        color: cColorNeutralBlack50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(20)
                        : getProportionateScreenWidth(20),
                  ),
                  LinearPercentIndicator(
                    barRadius: const Radius.circular(20.0),
                    lineHeight: kIsWeb
                        ? getWebProportionateScreenWidth(6)
                        : getProportionateScreenWidth(6),
                    percent: 0.67,
                    progressColor: cColorPrimary50,
                    backgroundColor: cColorNeutral50,
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(24)
                        : getProportionateScreenWidth(24),
                  ),
                  Text(
                    "Lokasi Pengiriman",
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
                        ? getWebProportionateScreenWidth(8)
                        : getProportionateScreenWidth(8),
                  ),
                  Text(
                    "Lokasi yang kamu isi nantinya akan menjadi titik lokasi pengiriman",
                    style: TextStyle(
                      fontSize: kIsWeb
                          ? getWebProportionateScreenWidth(12)
                          : getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w400,
                      color: cColorExpired50,
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(16)
                        : getProportionateScreenWidth(16),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jati Wetan",
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
                              "RT 1 RW 3 lorem ipsum",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: kIsWeb
                                      ? getWebProportionateScreenWidth(12)
                                      : getProportionateScreenWidth(12),
                                  fontWeight: FontWeight.w400,
                                  color: cColorExpired50),
                            )
                          ],
                        ),
                        PrimaryButton(
                          text: "Ganti Alamat",
                          press: () {},
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
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(24)
                        : getProportionateScreenWidth(24),
                  ),
                  Text(
                    "Metode Pengiriman",
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
                        ? getWebProportionateScreenWidth(8)
                        : getProportionateScreenWidth(8),
                  ),
                  Text(
                    "Kamu dapat memilih jasa  pengiriman yang kami sediakan",
                    style: TextStyle(
                      fontSize: kIsWeb
                          ? getWebProportionateScreenWidth(12)
                          : getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w400,
                      color: cColorExpired50,
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(16)
                        : getProportionateScreenWidth(16),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: cColorNeutral50),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedItemIndex =
                                    selectedItemIndex == index ? -1 : index;
                              });
                            },
                            child: Container(
                              height: kIsWeb
                                  ? getWebProportionateScreenWidth(70)
                                  : getProportionateScreenWidth(70),
                              decoration: BoxDecoration(
                                border: Border.all(color: cColorNeutral30),
                                color: index == selectedItemIndex
                                    ? cColorNeutral50
                                    : Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: kIsWeb
                                          ? getWebProportionateScreenWidth(16)
                                          : getProportionateScreenWidth(16),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: kIsWeb
                                              ? getWebProportionateScreenWidth(
                                                  24)
                                              : getProportionateScreenWidth(24),
                                          width: kIsWeb
                                              ? getWebProportionateScreenWidth(
                                                  24)
                                              : getProportionateScreenWidth(24),
                                          child: Image.asset(
                                            "assets/images/ekspedisi.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kIsWeb
                                              ? getWebProportionateScreenWidth(
                                                  8)
                                              : getProportionateScreenWidth(8),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "JNE Ekspress",
                                              style: TextStyle(
                                                fontSize: kIsWeb
                                                    ? getWebProportionateScreenWidth(
                                                        14)
                                                    : getProportionateScreenWidth(
                                                        14),
                                                fontWeight: FontWeight.w700,
                                                color: cColorNeutralBlack50,
                                              ),
                                            ),
                                            SizedBox(
                                              height: kIsWeb
                                                  ? getWebProportionateScreenWidth(
                                                      8)
                                                  : getProportionateScreenWidth(
                                                      8),
                                            ),
                                            Text(
                                              "Paket Regular: 20.000",
                                              style: TextStyle(
                                                fontSize: kIsWeb
                                                    ? getWebProportionateScreenWidth(
                                                        10)
                                                    : getProportionateScreenWidth(
                                                        10),
                                                fontWeight: FontWeight.w400,
                                                color: cColorExpired50,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: cColorPrimary50,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(24)
                        : getProportionateScreenWidth(24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: cColorPrimary50,
                        ),
                        child: Checkbox(
                          activeColor: cColorPrimary50,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ambil Sendiri",
                            style: TextStyle(
                              fontSize: kIsWeb
                                  ? getWebProportionateScreenWidth(14)
                                  : getProportionateScreenWidth(14),
                              fontWeight: FontWeight.w700,
                              color: cColorNeutralBlack50,
                            ),
                          ),
                          SizedBox(
                            height: kIsWeb
                                ? getWebProportionateScreenWidth(8)
                                : getProportionateScreenWidth(8),
                          ),
                          Text(
                            "Ambil pesananmu sendiri ke tempat penjual",
                            style: TextStyle(
                              fontSize: kIsWeb
                                  ? getWebProportionateScreenWidth(12)
                                  : getProportionateScreenWidth(12),
                              fontWeight: FontWeight.w400,
                              color: cColorExpired50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(16)
                        : getProportionateScreenWidth(16),
                  ),
                  isChecked
                      ? Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kIsWeb
                                ? getWebProportionateScreenWidth(20)
                                : getProportionateScreenWidth(20),
                            vertical: kIsWeb
                                ? getWebProportionateScreenWidth(10)
                                : getProportionateScreenWidth(10),
                          ),
                          height: kIsWeb
                              ? getWebProportionateScreenWidth(90)
                              : getProportionateScreenWidth(90),
                          decoration: BoxDecoration(
                            border: Border.all(color: cColorNeutral70),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Jl. Gondang Tim. II No.2, Bulusan, Kec. Tembalang, Kota Semarang, Jawa Tengah 50277, Indonesia',
                              style: TextStyle(
                                fontSize: kIsWeb
                                    ? getWebProportionateScreenWidth(12)
                                    : getProportionateScreenWidth(12),
                                fontWeight: FontWeight.w400,
                                color: cColorExpired30,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(32)
                        : getProportionateScreenWidth(32),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kIsWeb
                ? getWebProportionateScreenWidth(24)
                : getProportionateScreenWidth(24),
            vertical: kIsWeb
                ? getWebProportionateScreenWidth(24)
                : getProportionateScreenWidth(24),
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: cColorNeutral50),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: kIsWeb
                          ? getWebProportionateScreenWidth(14)
                          : getProportionateScreenWidth(14),
                      fontWeight: FontWeight.w700,
                      color: cColorNeutralBlack50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
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
                    child: Row(
                      children: [
                        Icon(Icons.keyboard_arrow_down, color: cColorPrimary50),
                        Text(
                          "Rp 80.000",
                          style: TextStyle(
                            fontSize: kIsWeb
                                ? getWebProportionateScreenWidth(14)
                                : getProportionateScreenWidth(14),
                            fontWeight: FontWeight.w700,
                            color: cColorError50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(20)
                    : getProportionateScreenWidth(20),
              ),
              PrimaryButton(
                text: "Pesan Sekarang",
                press: () {
                  Navigator.pushNamed(context, StatusBayarScreen.routeName);
                },
                button_width: double.infinity,
                color: cColorPrimary50,
                textColor: Colors.white,
                customFontWeight: FontWeight.w700,
                button_height: kIsWeb
                    ? getWebProportionateScreenWidth(32)
                    : getProportionateScreenWidth(32),
              )
            ],
          ),
        )
      ],
    );
  }
}

class MyBottomSheet extends StatelessWidget {
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
