// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoparea_app/components/button_style/primary_button.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/pengiriman_screen/alamat_bottom_sheet/kabupaten/kabupaten_search_field.dart';
import 'package:shoparea_app/screen/pengiriman_screen/alamat_bottom_sheet/kecamatan/kecamatan_search_field.dart';
import 'package:shoparea_app/screen/pengiriman_screen/alamat_bottom_sheet/kelurahan/kelurahan_search_field.dart';
import 'package:shoparea_app/screen/pengiriman_screen/alamat_bottom_sheet/kode_pos/kode_pos_search_field.dart';
import 'package:shoparea_app/screen/pengiriman_screen/alamat_bottom_sheet/provinsi/province_search_field.dart';
import 'package:shoparea_app/components/teks/text_field_with_counter.dart';

import '../../../size_config.dart';

class ProvinsiBottomSheet extends StatefulWidget {
  @override
  State<ProvinsiBottomSheet> createState() => _ProvinsiBottomSheetState();
}

class _ProvinsiBottomSheetState extends State<ProvinsiBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
                Center(
                  child: Image.asset(
                    "assets/images/iv_maps.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenWidth(24)
                      : getProportionateScreenWidth(24),
                ),
                TextFieldWithCounter(
                  teksTitle: "Alamat pengiriman*",
                  teksHint: "Masukan alamat pengirimanmu",
                  maxChar: 100,
                ),
                ProvinceSearchField(
                  onProvinceSelected: (String province) {},
                ),
                KabupatenSearchField(),
                KecamatanSearchField(),
                KelurahanSearchField(),
                KodePosSearchField(),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenWidth(48)
                      : getProportionateScreenWidth(48),
                ),
                PrimaryButton(
                  text: "Simpan",
                  press: () {
                    Navigator.of(context).pop();
                  },
                  button_width: double.infinity,
                  color: cColorExpired90,
                  textColor: Colors.white,
                  customFontWeight: FontWeight.w700,
                  button_height: kIsWeb
                      ? getWebProportionateScreenWidth(32)
                      : getProportionateScreenWidth(32),
                )
              ],
            )),
      ),
    );
  }
}
