// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/components/button_style/outlined_button_50.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/components/numeric_step_button.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/models/Transaction.dart';
import 'package:shoparea_app/utils/currency_formatter.dart';

import '../../../../components/sized_box/horizontal_sized_box.dart';
import '../../../../models/CartItems.dart';
import '../../../../size_config.dart';
import '../../../pengiriman_screen/pengiriman_screen.dart';

class ItemProductCard extends StatefulWidget {
  final Product? product;
  final Function()? press;

  const ItemProductCard({
    super.key,
    this.product,
    this.press,
  });

  @override
  State<ItemProductCard> createState() => _ItemProductCardState();
}

class _ItemProductCardState extends State<ItemProductCard> {
  bool isButtonVisible = true;
  int counterProduct = 1;

  bool isCounterVisible = false; // Membuat instance dari CartModel

  int selectedIndexWarna = 0;
  int selectedIndexUkuran = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.press,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                widget.product!.images[0],
                fit: BoxFit.fill,
                height: kIsWeb
                    ? getWebProportionateScreenWidth(154)
                    : getProportionateScreenWidth(154),
                width: kIsWeb
                    ? getWebProportionateScreenWidth(154)
                    : getProportionateScreenWidth(154),
              ),
              VerticalSizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(
                  left: kIsWeb
                      ? getWebProportionateScreenWidth(8)
                      : getProportionateScreenWidth(8),
                  right: kIsWeb
                      ? getWebProportionateScreenWidth(8)
                      : getProportionateScreenWidth(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      teks: widget.product!.title,
                      fontSize: 10,
                      teksColor: Colors.black,
                      fontWeight: FontWeight.w400,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    VerticalSizedBox(height: 8),
                    CustomText(
                        teks: CurrencyFormat.convertToIdr(
                                widget.product!.price, 0)
                            .toString(),
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        teksColor: Colors.black),
                    VerticalSizedBox(height: 16)
                  ],
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: kIsWeb
                  ? getWebProportionateScreenWidth(8)
                  : getProportionateScreenWidth(8),
              right: kIsWeb
                  ? getWebProportionateScreenWidth(8)
                  : getProportionateScreenWidth(8),
            ),
            child: Visibility(
              visible: isButtonVisible,
              child: OutlinedButton50(
                width: 131,
                height: 32,
                text: "Beli",
                press: () {
                  setState(() {
                    isButtonVisible = !isButtonVisible;
                    isCounterVisible = !isCounterVisible;
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: isCounterVisible,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    child: NumericStepButton(
                      // maxValue: 20,
                      onChanged: (value) {
                        counterProduct = value;
                        setState(() {
                          if (counterProduct == 0) {
                            isCounterVisible = !isCounterVisible;
                            isButtonVisible = !isButtonVisible;
                          }
                        });
                      },
                      counter: counterProduct,
                    ),
                  ),
                  VerticalSizedBox(height: 8),
                  PrimaryButton(
                    text: "Beli",
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
                      // Navigator.pushNamed(
                      //   context,
                      //   PengirimanScreen.routeName,
                      //   arguments: widget
                      //       .product, // Pass the 'product' data as an argument
                      // );
                    },
                    button_width: 131,
                    color: cColorPrimary50,
                    textColor: Colors.white,
                    customFontWeight: FontWeight.w700,
                    button_height: 32,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _checkoutProduct() {
    // Periksa apakah produk sudah ada di dalam keranjang
    Product productToCheckout = Product(
      id: widget.product!.id,
      images: widget.product!.images,
      title: widget.product!.title,
      category: widget.product!.category,
      description: widget.product!.description,
      price: widget.product!.price,
      size: widget.product!.size,
      colors: widget.product!.colors,
      stok: widget.product!.stok,
      numOfItems: counterProduct,
      selectedColor: selectedIndexWarna,
      selectedSize: selectedIndexUkuran,
    );
   

    
      .addToCart(productToCheckout);
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
    
    }
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
                    itemCount: widget.product?.size.length ?? 0,
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
                        counter: 1,
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
                  press: _checkoutProduct,
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
