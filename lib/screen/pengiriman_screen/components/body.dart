// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, prefer_const_declarations

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/pengiriman_screen/alamat_bottom_sheet/alamat_bottom_sheet.dart';
import 'package:shoparea_app/screen/status_bayar_screen/status_bayar_screen.dart';

import '../../../components/sized_box/horizontal_sized_box.dart';
import '../../../models/Product.dart';
import '../../../models/Transaction.dart';
import '../../../size_config.dart';
import '../../../utils/currency_formatter.dart';
import '../../front_store/front_store_screen.dart';
import 'harga_bottom_sheet.dart';

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
    final product = ModalRoute.of(context)?.settings.arguments as Product?;
    if (product == null) {
      // Tampilkan pesan atau lakukan penanganan lain ketika data product null
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kIsWeb
              ? getWebProportionateScreenWidth(24)
              : getProportionateScreenWidth(24),
        ),
        child: Column(
          children: [
            VerticalSizedBox(height: 100),
            Image.asset("assets/images/iv_bag_cart.png"),
            VerticalSizedBox(height: 32),
            CustomText(
              teks: "Product Tidak Ditemukan",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              teksColor: cColorNeutralBlack50,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            VerticalSizedBox(height: 16),
            CustomText(
              teks: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
              fontSize: 14,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              teksColor: cColorExpired50,
            ),
            VerticalSizedBox(height: 24),
            PrimaryButton(
              text: "Lihat produk yang tersedia",
              press: () {
                Navigator.pushNamed(context, FrontStoreScreen.routeName);
              },
              button_width: double.infinity,
              color: cColorPrimary50,
              textColor: Colors.white,
              customFontWeight: FontWeight.w700,
              button_height: 32,
            ),
          ],
        ),
      );
    }

    final int ongkosKirim = 20000;
    final int biayaAdmin = 4000;

    // Hitung total biaya
    final totalBiaya = product.price + ongkosKirim + biayaAdmin;

    final transactions = Transaction(
      products: [product],
      biayaAdmin: biayaAdmin,
      namaToko: "Nama Toko",
      jasaPengiriman: "JNE",
      ongkosKirim: ongkosKirim,
      statusBayar: "Belum Bayar",
      totalHarga: totalBiaya.toDouble(),
      totalProducts: 1,
      waktuPesan: DateTime.now(),
    );

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSizedBox(height: 24),
                  Center(
                    child: CustomText(
                      teks: "Pengiriman",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      teksColor: cColorNeutralBlack50,
                    ),
                  ),
                  VerticalSizedBox(height: 20),
                  LinearPercentIndicator(
                    barRadius: const Radius.circular(20.0),
                    lineHeight: kIsWeb
                        ? getWebProportionateScreenWidth(6)
                        : getProportionateScreenWidth(6),
                    percent: 0.67,
                    progressColor: cColorPrimary50,
                    backgroundColor: cColorNeutral50,
                  ),
                  VerticalSizedBox(height: 24),
                  CustomText(
                    teks: "Lokasi Pengiriman",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    teksColor: cColorNeutralBlack50,
                  ),
                  VerticalSizedBox(height: 8),
                  CustomText(
                    teks:
                        "Lokasi yang kamu isi nantinya akan menjadi titik lokasi pengiriman",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    teksColor: cColorExpired50,
                  ),
                  VerticalSizedBox(height: 16),
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
                            CustomText(
                              teks:
                                  "Jati Wetan", // ini adalah alamat yang harusnya dikasih nilai dari bottom sheet
                              fontSize: 12,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              teksColor: cColorNeutralBlack50,
                            ),
                            VerticalSizedBox(height: 8),
                            CustomText(
                              teks: "RT 1 RW 3 lorem ipsum",
                              fontSize: 10,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                              teksColor: cColorExpired50,
                            ),
                          ],
                        ),
                        PrimaryButton(
                          text: "Ganti Alamat",
                          press: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              isDismissible: true,
                              useSafeArea: true,
                              constraints: BoxConstraints(
                                maxWidth: kIsWeb ? 400 : double.infinity,
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.9,
                              ),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return AlamatBottomSheet();
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
                  ),
                  VerticalSizedBox(height: 24),
                  CustomText(
                    teks: "Metode Pengiriman",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    teksColor: cColorNeutralBlack50,
                  ),
                  VerticalSizedBox(height: 8),
                  CustomText(
                    teks:
                        "Kamu dapat memilih jasa  pengiriman yang kami sediakan",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    teksColor: cColorExpired50,
                  ),
                  VerticalSizedBox(height: 16),
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
                  VerticalSizedBox(height: 24),
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
                          CustomText(
                            teks: "Ambil Sendiri",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            teksColor: cColorNeutralBlack50,
                          ),
                          VerticalSizedBox(height: 8),
                          CustomText(
                            teks: "Ambil pesananmu sendiri ke tempat penjual",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            teksColor: cColorExpired50,
                          ),
                        ],
                      ),
                    ],
                  ),
                  VerticalSizedBox(height: 16),
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
                  VerticalSizedBox(height: 32),
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
                  CustomText(
                    teks: "Total",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    teksColor: cColorNeutralBlack50,
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
                          return HargaBottomSheet(
                            ongkosKirim: ongkosKirim,
                            biayaAdmin: biayaAdmin,
                            subTotal: product.price,
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.keyboard_arrow_down, color: cColorPrimary50),
                        CustomText(
                          teks: CurrencyFormat.convertToIdr(totalBiaya, 0)
                              .toString(),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          teksColor: cColorError50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              VerticalSizedBox(height: 20),
              PrimaryButton(
                text: "Pesan Sekarang",
                press: () {
                  Navigator.pushNamed(
                    context,
                    StatusBayarScreen.routeName,
                    arguments:
                        transactions, // Pass the 'product' data as an argument
                  );

                  transactions.addData(transactions);

                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxWidth: kIsWeb ? 352 : double.infinity,
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.85,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                color: Colors.transparent,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF0FAF7),
                                  border: Border.all(
                                    color: cColorPrimary50,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("assets/images/check.png"),
                                      HorizontalSizedBox(width: 24),
                                      CustomText(
                                        teks: "Sukses memesan produk!",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        teksColor: cColorNeutralBlack50,
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Image.asset(
                                            "assets/images/cross.png"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                button_width: double.infinity,
                color: cColorPrimary50,
                textColor: Colors.white,
                customFontWeight: FontWeight.w700,
                button_height: 32,
              )
            ],
          ),
        )
      ],
    );
  }
}
