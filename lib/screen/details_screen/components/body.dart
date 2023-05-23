// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/components/button_style/outlined_button_with_icon.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/screen/details_screen/components/product/image_product.dart';
import 'package:shoparea_app/screen/details_screen/components/product/product_description.dart';
import 'package:shoparea_app/screen/details_screen/components/product/product_text_title_value.dart';
import 'package:shoparea_app/screen/pengiriman_screen/pengiriman_screen.dart';
import 'package:shoparea_app/utils/currency_formatter.dart';

import '../../../components/numeric_step_button.dart';
import '../../../components/sized_box/horizontal_sized_box.dart';
import '../../../models/CartItems.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  final Product? product;

  const Body({Key? key, this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

late int? counterProduct;

class _BodyState extends State<Body> {
  int selectedIndexWarna = 0;
  int selectedIndexUkuran = 0;

  final CartModel _cartModel = CartModel(); // Membuat instance dari CartModel

  void _addToCart() {
    // Periksa apakah produk sudah ada di dalam keranjang
    bool isProductInCart = cartItems.contains(widget.product);

    // Jika produk belum ada di dalam keranjang, tambahkan ke dalam keranjang
    if (!isProductInCart) {
      _cartModel.addToCart(widget.product!);
      // Setelah berhasil ditambahkan, tampilkan pesan atau notifikasi
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/images/check.png"),
                          HorizontalSizedBox(width: 24),
                          CustomText(
                            teks: "Produk Berhasil Ditambahkan",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            teksColor: cColorNeutralBlack50,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset("assets/images/cross.png"),
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
    } else {
      // Jika produk sudah ada di dalam keranjang, tampilkan pesan atau notifikasi
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
                      color: const Color(
                          0xFFFDF1F0), // Ubah #FDF1F0 menjadi 0xFFFDF1F0
                      border: Border.all(
                        color: cColorError50,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/images/cross_red.png"),
                          HorizontalSizedBox(width: 24),
                          CustomText(
                            teks: "Produk Sudah Ada di Keranjang!",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            teksColor: cColorNeutralBlack50,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child:
                                Image.asset("assets/images/cross_red_line.png"),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  ImageProduct(widget: widget),
                  VerticalSizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              teks: widget.product?.title ?? '',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              teksColor: cColorNeutralBlack50,
                            ),
                            VerticalSizedBox(height: 8),
                            CustomText(
                              teks: CurrencyFormat.convertToIdr(
                                      widget.product?.price ?? 0, 0)
                                  .toString(),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              teksColor: cColorError50,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/ic_link.svg",
                          // By default our icon color is white
                          color: cColorExpired50,
                        ),
                        onPressed: () {},
                        iconSize: 24, // Tambahkan properti iconSize
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/ic_share.svg",
                          // By default our icon color is white
                          color: cColorSecondary50,
                        ),
                        onPressed: () {},
                        iconSize: 24, // Tambahkan properti iconSize
                      ),
                    ],
                  ),
                  VerticalSizedBox(height: 32),
                  ProductDescription(widget: widget),
                  VerticalSizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: kIsWeb
                          ? getWebProportionateScreenWidth(24)
                          : getProportionateScreenWidth(24),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: cColorNeutral30),
                        bottom: BorderSide(color: cColorNeutral30),
                      ),
                    ),
                    child: TextProductDetailsTitleValue(
                      widget: widget,
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
                      title: "Variasi : ",
                      value:
                          "(${widget.product?.colors.length.toString()} Warna, ${widget.product?.size.length.toString()} Ukuran)",
                    ),
                  ),
                  VerticalSizedBox(height: 16),
                  TextProductDetailsTitleValue(
                      widget: widget,
                      press: () {},
                      title: "Stok : ",
                      value: "${widget.product?.stok.toString()} Item"),
                  VerticalSizedBox(height: 24),
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                OutlinedButtonWithIcon(
                  text: "Keranjang",
                  button_width: 125,
                  button_height: 32,
                  press: _addToCart,
                  icon: Icons.add,
                ),
                Spacer(),
                PrimaryButton(
                  color: cColorPrimary50,
                  text: "Beli Sekarang",
                  textColor: Colors.white,
                  customFontWeight: FontWeight.bold,
                  press: () {
                    Navigator.pushNamed(context, PengirimanScreen.routeName);
                  },
                  button_width: 125,
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
      height: MediaQuery.of(context).size.height *
          0.9, // Set height to the full height of the screen
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kIsWeb
              ? getWebProportionateScreenWidth(24)
              : getProportionateScreenWidth(24),
          vertical: kIsWeb
              ? getWebProportionateScreenWidth(16)
              : getProportionateScreenWidth(16),
        ),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset("assets/icons/img_bottom_sheet.svg"),
                ),
                VerticalSizedBox(height: 24),
                CustomText(
                  teks: "Pilih Variasi",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  teksColor: cColorNeutralBlack50,
                ),
                VerticalSizedBox(height: 8),
                CustomText(
                  teks: "Lorem ipsum dolor sit amet, consectetur ",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  teksColor: cColorExpired50,
                ),
                VerticalSizedBox(height: 24),
                CustomText(
                  teks: "Pilih Warna",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  teksColor: cColorNeutralBlack50,
                ),
                VerticalSizedBox(height: 8),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenWidth(28)
                      : getProportionateScreenWidth(28),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.product?.colors.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return buildWarna(index, setState);
                    },
                  ),
                ),
                VerticalSizedBox(height: 16),
                Divider(),
                VerticalSizedBox(height: 16),
                CustomText(
                  teks: "Pilih Ukuran",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  teksColor: cColorNeutralBlack50,
                ),
                VerticalSizedBox(height: 8),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenWidth(28)
                      : getProportionateScreenWidth(28),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.product?.colors.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return buildUkuran(index, setState);
                    },
                  ),
                ),
                VerticalSizedBox(height: 16),
                Divider(),
                VerticalSizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      teks: "Stok",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      teksColor: cColorNeutralBlack50,
                    ),
                    CustomText(
                      teks: "${widget.product?.stok.toString()} Item",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      teksColor: cColorExpired50,
                    ),
                  ],
                ),
                VerticalSizedBox(height: 16),
                Divider(),
                VerticalSizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      teks: "Jumlah",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      teksColor: cColorNeutralBlack50,
                    ),
                    SizedBox(
                      width: 100,
                      child: NumericStepButton(
                        // maxValue: 20,
                        onChanged: (value) {
                          counterProduct = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                VerticalSizedBox(height: 16),
                Divider(),
                VerticalSizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      teks: "Harga",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      teksColor: cColorNeutralBlack50,
                    ),
                    VerticalSizedBox(height: 8),
                    CustomText(
                      teks: CurrencyFormat.convertToIdr(
                              widget.product?.price ?? 0, 0)
                          .toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      teksColor: cColorError50,
                    ),
                  ],
                ),
                VerticalSizedBox(height: 16),
                PrimaryButton(
                  color: cColorPrimary50,
                  text: "Konfirmasi",
                  textColor: Colors.white,
                  customFontWeight: FontWeight.bold,
                  press: _addToCart,
                  button_width: double.infinity,
                  button_height: 32,
                ),
                VerticalSizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildWarna(int index, StateSetter setState) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndexWarna = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: kIsWeb
              ? getWebProportionateScreenWidth(5)
              : getProportionateScreenWidth(5),
          horizontal: kIsWeb
              ? getWebProportionateScreenWidth(16)
              : getProportionateScreenWidth(16),
        ),
        margin: EdgeInsets.only(
          right: kIsWeb
              ? getWebProportionateScreenWidth(8)
              : getProportionateScreenWidth(8),
        ),
        decoration: BoxDecoration(
          color: selectedIndexWarna == index ? cColorPrimary50 : Colors.white,
          border: Border.all(
            width: selectedIndexWarna == index ? 1 : 2,
            color:
                selectedIndexWarna == index ? cColorPrimary50 : cColorNeutral50,
          ),
          borderRadius: BorderRadius.circular(
            kIsWeb
                ? getWebProportionateScreenWidth(4)
                : getProportionateScreenWidth(4),
          ),
        ),
        child: Text(
          widget.product!.colors[index],
          style: TextStyle(
            color: selectedIndexWarna == index ? Colors.white : cColorExpired50,
            fontWeight:
                selectedIndexWarna == index ? FontWeight.bold : FontWeight.w400,
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(12)
                : getProportionateScreenWidth(12),
          ),
        ),
      ),
    );
  }

  Widget buildUkuran(int index, StateSetter setState) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndexUkuran = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: kIsWeb
              ? getWebProportionateScreenWidth(5)
              : getProportionateScreenWidth(5),
          horizontal: kIsWeb
              ? getWebProportionateScreenWidth(16)
              : getProportionateScreenWidth(16),
        ),
        margin: EdgeInsets.only(
          right: kIsWeb
              ? getWebProportionateScreenWidth(8)
              : getProportionateScreenWidth(8),
        ),
        decoration: BoxDecoration(
          color: selectedIndexUkuran == index ? cColorPrimary50 : Colors.white,
          border: Border.all(
            width: selectedIndexUkuran == index ? 1 : 2,
            color: selectedIndexUkuran == index
                ? cColorPrimary50
                : cColorNeutral50,
          ),
          borderRadius: BorderRadius.circular(
            kIsWeb
                ? getWebProportionateScreenWidth(4)
                : getProportionateScreenWidth(4),
          ),
        ),
        child: Text(
          widget.product!.size[index],
          style: TextStyle(
            color:
                selectedIndexUkuran == index ? Colors.white : cColorExpired50,
            fontWeight: selectedIndexUkuran == index
                ? FontWeight.bold
                : FontWeight.w400,
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(12)
                : getProportionateScreenWidth(12),
          ),
        ),
      ),
    );
  }
}
