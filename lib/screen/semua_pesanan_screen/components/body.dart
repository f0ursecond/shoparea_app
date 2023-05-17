// ignore_for_file: non_constant_identifier_names, prefer_final_fields, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/models/Transaction.dart';
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
  bool isEmptyStateVisible = false;
  bool isListProductVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: kIsWeb
              ? getWebProportionateScreenWidth(84)
              : getProportionateScreenWidth(84),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 10), // changes position of shadow
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: (24)),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: cColorPrimary10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: cColorNeutral70),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: cColorError50),
                  ),
                  hintText: 'Mau cari apa?',
                  hintStyle: TextStyle(
                    color: cColorExpired30,
                    fontWeight: FontWeight.w400,
                    fontSize: (12),
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
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
                              DateTime waktuPesan =
                                  transactions[index].waktuPesan;

                              // mengambil tanggal, nama bulan, dan tahun dari waktu pesan
                              String tanggal =
                                  DateFormat('dd').format(waktuPesan);
                              String namaBulan =
                                  DateFormat('MMMM').format(waktuPesan);
                              String tahun =
                                  DateFormat('yyyy').format(waktuPesan);
                              String jam = DateFormat('HH').format(waktuPesan);
                              String menit =
                                  DateFormat('mm').format(waktuPesan);

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
                                          Text(
                                            transaction.namaToko,
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
                                                    4)
                                                : getProportionateScreenWidth(
                                                    4),
                                          ),
                                          Text(
                                            product.title,
                                            style: TextStyle(
                                              fontSize: kIsWeb
                                                  ? getWebProportionateScreenWidth(
                                                      12)
                                                  : getProportionateScreenWidth(
                                                      12),
                                              fontWeight: FontWeight.w400,
                                              color: cColorExpired50,
                                            ),
                                          ),
                                          SizedBox(
                                            height: kIsWeb
                                                ? getWebProportionateScreenWidth(
                                                    4)
                                                : getProportionateScreenWidth(
                                                    4),
                                          ),
                                          Text(
                                            "Total Produk: ${transaction.totalProducts}",
                                            style: TextStyle(
                                              fontSize: kIsWeb
                                                  ? getWebProportionateScreenWidth(
                                                      10)
                                                  : getProportionateScreenWidth(
                                                      10),
                                              fontWeight: FontWeight.w400,
                                              color: cColorError50,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            waktu,
                                            style: TextStyle(
                                              fontSize: kIsWeb
                                                  ? getWebProportionateScreenWidth(
                                                      12)
                                                  : getProportionateScreenWidth(
                                                      12),
                                              fontWeight: FontWeight.w500,
                                              color: cColorWarning50,
                                            ),
                                          ),
                                          Text(
                                            jamTampil,
                                            style: TextStyle(
                                              fontSize: kIsWeb
                                                  ? getWebProportionateScreenWidth(
                                                      12)
                                                  : getProportionateScreenWidth(
                                                      12),
                                              fontWeight: FontWeight.w500,
                                              color: cColorWarning50,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: kIsWeb
                                        ? getWebProportionateScreenWidth(16)
                                        : getProportionateScreenWidth(16),
                                  ),
                                  Divider(
                                    color: cColorNeutral30,
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: kIsWeb
                                        ? getWebProportionateScreenWidth(16)
                                        : getProportionateScreenWidth(16),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Status Pembayaran",
                                        style: TextStyle(
                                          fontSize: kIsWeb
                                              ? getWebProportionateScreenWidth(
                                                  12)
                                              : getProportionateScreenWidth(12),
                                          fontWeight: FontWeight.w400,
                                          color: cColorExpired50,
                                        ),
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
                                          transaction.statusBayar,
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
                                  SizedBox(
                                    height: kIsWeb
                                        ? getWebProportionateScreenWidth(16)
                                        : getProportionateScreenWidth(16),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Jasa Pengiriman",
                                        style: TextStyle(
                                          fontSize: kIsWeb
                                              ? getWebProportionateScreenWidth(
                                                  12)
                                              : getProportionateScreenWidth(12),
                                          fontWeight: FontWeight.w400,
                                          color: cColorExpired50,
                                        ),
                                      ),
                                      Text(
                                        transaction.jasaPengiriman,
                                        style: TextStyle(
                                          fontSize: kIsWeb
                                              ? getWebProportionateScreenWidth(
                                                  10)
                                              : getProportionateScreenWidth(10),
                                          fontWeight: FontWeight.w600,
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
                                  Divider(
                                    color: cColorNeutral30,
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: kIsWeb
                                        ? getWebProportionateScreenWidth(16)
                                        : getProportionateScreenWidth(16),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        CurrencyFormat.convertToIdr(
                                                transaction.totalHarga, 0)
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: kIsWeb
                                              ? getWebProportionateScreenWidth(
                                                  16)
                                              : getProportionateScreenWidth(16),
                                          fontWeight: FontWeight.w700,
                                          color: cColorNeutralBlack50,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kIsWeb
                                        ? getWebProportionateScreenWidth(24)
                                        : getProportionateScreenWidth(24),
                                  ),
                                  PrimaryButton(
                                    text:
                                        transaction.statusBayar == "Sudah Bayar"
                                            ? "Lacak Pesanan"
                                            : "Bayar Sekarang",
                                    press: () {
                                      Navigator.pushNamed(
                                        context,
                                        transaction.statusBayar == "Sudah Bayar"
                                            ? TrackingPesananScreen.routeName
                                            : StatusBayarScreen.routeName,
                                      );
                                    },
                                    button_width: double.infinity,
                                    color:
                                        transaction.statusBayar == "Sudah Bayar"
                                            ? cColorNeutral30
                                            : cColorPrimary50,
                                    textColor:
                                        transaction.statusBayar == "Sudah Bayar"
                                            ? cColorPrimary50
                                            : Colors.white,
                                    customFontWeight: FontWeight.w700,
                                    button_height: kIsWeb
                                        ? getWebProportionateScreenWidth(32)
                                        : getProportionateScreenWidth(32),
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
              Visibility(
                visible: isEmptyStateVisible,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/iv_empty_state.png"),
                      Text(
                        "Hasil Tidak Ditemukan",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: (20),
                          color: cColorNeutralBlack50,
                        ),
                      ),
                      SizedBox(
                        height: (8),
                      ),
                      Text(
                        "Coba dengan keyword lain",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: (14),
                          color: cColorExpired50,
                        ),
                      )
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
