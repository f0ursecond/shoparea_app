// ignore_for_file: prefer_const_constructors, unnecessary_import, library_private_types_in_public_api, sized_box_for_whitespace

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../consts/colors.dart';
import '../../../../size_config.dart';

class KecamatanSearchField extends StatefulWidget {
  const KecamatanSearchField({
    Key? key,
  }) : super(key: key);

  @override
  _KecamatanSearchFieldState createState() => _KecamatanSearchFieldState();
}

class _KecamatanSearchFieldState extends State<KecamatanSearchField> {
  final TextEditingController _controller = TextEditingController();
  bool _showSearchField = false;

  final List<String> _kecamatans = [
    'Langsa Barat',
    'Langsa Kota',
    'Langsa Lama',
    'Babussalam',
    'Simpang Kiri',
    'Pegajahan',
    'Medan Perjuangan',
    'Medan Marelan',
    'Medan Belawan',
    'Padang Panjang Timur',
    'Padang Panjang Barat',
    'Lubuk Basung',
    'Tanjung Raya',
    'Pariaman Tengah',
    'Pariaman Selatan',
  ];

  List<String> _searchResults = [];

  void _onSearch(String query) {
    setState(() {
      _searchResults = _kecamatans
          .where((kecamatan) =>
              kecamatan.toLowerCase().contains(query.toLowerCase()))
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
        Text(
          "Nama Kecamatan",
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
            hintText: 'Pilih asal kecamatan kamu',
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
