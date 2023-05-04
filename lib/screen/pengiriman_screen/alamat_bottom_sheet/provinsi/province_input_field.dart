// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/pengiriman_screen/alamat_bottom_sheet/provinsi/province_search_field.dart';

import '../../../../consts/colors.dart';
import '../../../../size_config.dart';

class ProvinceInputField extends StatefulWidget {
  const ProvinceInputField({Key? key}) : super(key: key);

  @override
  State<ProvinceInputField> createState() => _ProvinceInputFieldState();
}

class _ProvinceInputFieldState extends State<ProvinceInputField> {
  bool _showProvinceSearchField = false;
  String _selectedProvince = '';

  void _onProvinceSelected(String province) {
    setState(() {
      _selectedProvince = province;
      _showProvinceSearchField = false;
    });
    // update text field with selected province
    if (_selectedProvince.isNotEmpty) {
      // hide province search field
      _showProvinceSearchField = false;
      // hide keyboard
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nama Provinsi",
          style: TextStyle(
            color: cColorNeutralBlack50,
            fontWeight: FontWeight.w700,
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(14)
                : getProportionateScreenWidth(14),
          ),
        ),
        SizedBox(
          height: kIsWeb
              ? getWebProportionateScreenWidth(8)
              : getProportionateScreenWidth(8),
        ),
        Column(
          children: [
            // ini namanya adalah teksfield UTAMA
            TextField(
              readOnly: true,
              controller: TextEditingController(text: _selectedProvince),
              onTap: () {
                setState(() {
                  _showProvinceSearchField = !_showProvinceSearchField;
                });
              },
              maxLength: 100,
              decoration: InputDecoration(
                counter: Offstage(),
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
                hintText: 'Pilih asal provinsi kamu',
                hintStyle: TextStyle(
                  color: cColorExpired30,
                  fontWeight: FontWeight.w400,
                  fontSize: kIsWeb
                      ? getWebProportionateScreenWidth(12)
                      : getProportionateScreenWidth(12),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_drop_down, color: cColorExpired50),
                  onPressed: () {},
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            Visibility(
              visible: _showProvinceSearchField,
              child:
                  ProvinceSearchField(onProvinceSelected: _onProvinceSelected),
            ),
          ],
        ),
      ],
    );
  }
}
