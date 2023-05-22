// ignore_for_file: prefer_const_constructors, unnecessary_import, library_private_types_in_public_api, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../components/sized_box/vertical_sized_box.dart';
import '../../../../components/teks/custom_teks.dart';
import '../../../../consts/colors.dart';
import '../../../../size_config.dart';

class KodePosSearchField extends StatefulWidget {
  const KodePosSearchField({
    Key? key,
  }) : super(key: key);

  @override
  KodePosSearchFieldState createState() => KodePosSearchFieldState();
}

class KodePosSearchFieldState extends State<KodePosSearchField> {
  final TextEditingController _controller = TextEditingController();
  bool _showSearchField = false;

  final List<String> kode_poses = [
    '20112', // Medan Baru, Kota Medan, Sumatera Utara
    '20214', // Medan Sunggal, Kota Medan, Sumatera Utara
    '20371', // Percut Sei Tuan, Deli Serdang, Sumatera Utara
    '30113', // Pagar Alam, Kota Pagar Alam, Sumatera Selatan
    '30139', // Dempo Selatan, Kota Pagar Alam, Sumatera Selatan
    '40115', // Balikpapan Selatan, Kota Balikpapan, Kalimantan Timur
    '40171', // Samarinda Ilir, Kota Samarinda, Kalimantan Timur
    '50125', // Sario, Kota Manado, Sulawesi Utara
    '50198', // Kalawat, Kabupaten Minahasa, Sulawesi Utara
    '60225', // Wajo, Kota Makassar, Sulawesi Selatan
    '70234', // Tanjung Redeb, Kabupaten Berau, Kalimantan Timur
    '80118', // Denpasar Barat, Kota Denpasar, Bali
    '80361', // Kuta, Badung, Bali
    '90111', // Banda Aceh, Kota Banda Aceh, Aceh
    '96128', // Tahuna, Kabupaten Sangihe, Sulawesi Utara
  ];
  List<String> _searchResults = [];

  void _onSearch(String query) {
    setState(() {
      _searchResults = kode_poses
          .where((kode_pos) =>
              kode_pos.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleSearchField() {
    setState(() {
      _showSearchField = !_showSearchField;
      _searchResults.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          teks: "Kode Pos",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          teksColor: cColorNeutralBlack50,
        ),
        VerticalSizedBox(height: 8),
        TextField(
          onTap: _toggleSearchField,
          controller: _controller,
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
            hintText: 'Pilih kode pos kamu',
            hintStyle: TextStyle(
              color: cColorExpired30,
              fontWeight: FontWeight.w400,
              fontSize: kIsWeb
                  ? getWebProportionateScreenWidth(12)
                  : getProportionateScreenWidth(12),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.search, color: cColorExpired50),
              onPressed: () {},
            ),
          ),
          onChanged: _showSearchField ? _onSearch : null,
        ),
        if (_showSearchField)
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_searchResults[index]),
                onTap: () {
                  _controller.text = _searchResults[index];
                  _toggleSearchField();
                },
              ),
            ),
          )
      ],
    );
  }
}
