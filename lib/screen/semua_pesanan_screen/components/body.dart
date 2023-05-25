// ignore_for_file: non_constant_identifier_names, prefer_final_fields, prefer_const_constructors, unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/models/Transaction.dart';
import 'package:shoparea_app/screen/semua_pesanan_screen/components/search_transaction.dart';
import 'package:shoparea_app/screen/status_bayar_screen/status_bayar_screen.dart';
import 'package:shoparea_app/screen/tracking_pesanan/tracking_pesanan_screen.dart';

import '../../../consts/colors.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../../utils/currency_formatter.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Transaction> transactions = Transaction.getAllData();

  bool isEmptyStateVisible = false;
  bool isListTransactionVisible = false;

  @override
  void initState() {
    super.initState();
    transactions = Transaction.getAllData();
    isEmptyStateVisible = transactions.isEmpty;
    isListTransactionVisible = transactions.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTransaction(),
        Expanded(
          child: Stack(
            children: [
              Visibility(
                visible: isListTransactionVisible,
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    Transaction transaction = transactions[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        top: kIsWeb
                            ? getWebProportionateScreenWidth(24)
                            : getProportionateScreenWidth(24),
                        left: kIsWeb
                            ? getWebProportionateScreenWidth(24)
                            : getProportionateScreenWidth(24),
                        right: kIsWeb
                            ? getWebProportionateScreenWidth(24)
                            : getProportionateScreenWidth(24),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: kIsWeb
                              ? getWebProportionateScreenWidth(24)
                              : getProportionateScreenWidth(24),
                          horizontal: kIsWeb
                              ? getWebProportionateScreenWidth(24)
                              : getProportionateScreenWidth(24),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: cColorNeutral50),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: transaction.products.length,
                              itemBuilder: (BuildContext context, int index) {
                                Product product = transaction.products[index];
                                // mengambil waktu pesan dari transaction pada index tertentu
                                DateTime waktuPesan = transaction.waktuPesan;

                                // mengambil tanggal, nama bulan, dan tahun dari waktu pesan
                                String tanggal = DateFormat('dd')
                                    .format(transaction.waktuPesan);
                                String namaBulan = DateFormat('MMMM')
                                    .format(transaction.waktuPesan);
                                String tahun = DateFormat('yyyy')
                                    .format(transaction.waktuPesan);
                                String jam = DateFormat('HH')
                                    .format(transaction.waktuPesan);
                                String menit = DateFormat('mm')
                                    .format(transaction.waktuPesan);

                                // menggabungkan tanggal, nama bulan, dan tahun menjadi satu teks
                                String waktu = "$tanggal $namaBulan $tahun";
                                String jamTampil = "$jam:$menit";

                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.network(
                                          product.images[0],
                                          height: 66, // set height to  pixels
                                          width: 66, // set width to  pixels
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              teks: transaction.namaToko,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              teksColor: cColorNeutralBlack50,
                                            ),
                                            VerticalSizedBox(height: 4),
                                            CustomText(
                                              teks: product.title,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              teksColor: cColorExpired50,
                                            ),
                                            VerticalSizedBox(height: 4),
                                            CustomText(
                                              teks:
                                                  "Total Produk: ${transaction.totalProducts}",
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              teksColor: cColorError50,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            CustomText(
                                              teks: waktu,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              teksColor: cColorWarning50,
                                            ),
                                            CustomText(
                                              teks: jamTampil,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              teksColor: cColorWarning50,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    VerticalSizedBox(height: 16),
                                    Divider(
                                      color: cColorNeutral30,
                                      thickness: 1,
                                    ),
                                    VerticalSizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          teks: "Status Pembayaran",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          teksColor: cColorExpired50,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: transaction.statusBayar ==
                                                      'Belum Bayar'
                                                  ? cColorError50
                                                  : cColorPrimary50,
                                              width: 1,
                                            ),
                                            color: transaction.statusBayar ==
                                                    'Belum Bayar'
                                                ? Colors.transparent
                                                : cColorPrimary50
                                                    .withOpacity(0.1),
                                          ),
                                          child: Text(
                                            transaction.statusBayar.toString(),
                                            style: TextStyle(
                                              fontSize: kIsWeb
                                                  ? getWebProportionateScreenWidth(
                                                      10)
                                                  : getProportionateScreenWidth(
                                                      10),
                                              fontWeight: FontWeight.w600,
                                              color: transaction.statusBayar ==
                                                      'Belum Bayar'
                                                  ? cColorError50
                                                  : cColorPrimary50,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalSizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          teks: "Jasa Pengiriman",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          teksColor: cColorExpired50,
                                        ),
                                        CustomText(
                                          teks: transaction.jasaPengiriman,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          teksColor: cColorPrimary50,
                                        ),
                                      ],
                                    ),
                                    VerticalSizedBox(height: 16),
                                    Divider(
                                      color: cColorNeutral30,
                                      thickness: 1,
                                    ),
                                    VerticalSizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          teks: CurrencyFormat.convertToIdr(
                                                  transaction.totalHarga, 0)
                                              .toString(),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          teksColor: cColorNeutralBlack50,
                                        ),
                                      ],
                                    ),
                                    VerticalSizedBox(height: 24),
                                    PrimaryButton(
                                      text: transaction.statusBayar ==
                                              "Sudah Bayar"
                                          ? "Lacak Pesanan"
                                          : "Bayar Sekarang",
                                      press: () {
                                        Navigator.pushNamed(
                                          context,
                                          transaction.statusBayar ==
                                                  "Sudah Bayar"
                                              ? TrackingPesananScreen.routeName
                                              : StatusBayarScreen.routeName,
                                          arguments: transaction,
                                        );
                                      },
                                      button_width: double.infinity,
                                      color: transaction.statusBayar ==
                                              "Sudah Bayar"
                                          ? cColorNeutral30
                                          : cColorPrimary50,
                                      textColor: transaction.statusBayar ==
                                              "Sudah Bayar"
                                          ? cColorPrimary50
                                          : Colors.white,
                                      customFontWeight: FontWeight.w700,
                                      button_height: 32,
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: isEmptyStateVisible,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/iv_empty_state.png"),
                      CustomText(
                        teks: "Belum ada transaksi",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        teksColor: cColorNeutralBlack50,
                      ),
                      VerticalSizedBox(height: 8),
                      CustomText(
                        teks: "Ayo mulai bertransaksi!",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        teksColor: cColorExpired50,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
