// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, prefer_const_declarations

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Transaction.dart';
import 'package:shoparea_app/screen/front_store/front_store_screen.dart';
import 'package:shoparea_app/screen/pengiriman_screen/components/body.dart';
import 'package:shoparea_app/screen/pengiriman_screen/components/harga_bottom_sheet.dart';

import '../../../components/button_style/primary_button.dart';
import '../../../components/sized_box/horizontal_sized_box.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../../utils/currency_formatter.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final transaction =
        ModalRoute.of(context)?.settings.arguments as Transaction?;

    if (transaction == null) {
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
              teks: "Transaksi Tidak Ditemukan",
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
    final totalBiaya = transaction.products[0].price + ongkosKirim + biayaAdmin;

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
                              teks: CurrencyFormat.convertToIdr(totalBiaya, 0)
                                  .toString(),
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
                                return HargaBottomSheet(
                                  subTotal: transaction.products[0].price,
                                  biayaAdmin: biayaAdmin,
                                  ongkosKirim: ongkosKirim,
                                );
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
                press: () {
                  setState(() {
                    transaction.statusBayar = "Sudah Bayar";
                  });

                  Navigator.pushNamed(context, FrontStoreScreen.routeName);
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
                                        teks: "Sukses membayar produk!",
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
