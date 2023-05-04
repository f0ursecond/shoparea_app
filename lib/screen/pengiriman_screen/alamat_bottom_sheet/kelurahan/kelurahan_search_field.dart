// ignore_for_file: prefer_const_constructors, unnecessary_import, library_private_types_in_public_api, sized_box_for_whitespace

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../consts/colors.dart';
import '../../../../size_config.dart';

class KelurahanSearchField extends StatefulWidget {
  const KelurahanSearchField({
    Key? key,
  }) : super(key: key);

  @override
  KelurahanSearchFieldState createState() => KelurahanSearchFieldState();
}

class KelurahanSearchFieldState extends State<KelurahanSearchField> {
  final TextEditingController _controller = TextEditingController();
  bool _showSearchField = false;

  final List<String> kelurahans = [
    'Aceh',
    'Sumatera Utara',
    'Sumatera Barat',
    'Riau',
    'Kepulauan Riau',
    'Jambi',
    'Sumatera Selatan',
    'Bangka Belitung',
    'Bengkulu',
    'Lampung',
    'DKI Jakarta',
    'Jawa Barat',
    'Banten',
    'Jawa Tengah',
    'DI Yogyakarta',
    'Jawa Timur',
    'Bali',
    'Nusa Tenggara Barat',
    'Nusa Tenggara Timur',
    'Kalimantan Barat',
    'Kalimantan Tengah',
    'Kalimantan Selatan',
    'Kalimantan Timur',
    'Kalimantan Utara',
    'Sulawesi Utara',
    'Gorontalo',
    'Sulawesi Tengah',
    'Sulawesi Barat',
    'Sulawesi Selatan',
    'Sulawesi Tenggara',
    'Maluku',
    'Maluku Utara',
    'Papua Barat',
    'Papua',
    'Kepulauan Bangka Belitung',
    'Bengkulu',
    'Kepulauan Seribu',
  ];

  List<String> _searchResults = [];

  void _onSearch(String query) {
    setState(() {
      _searchResults = kelurahans
          .where((kelurahan) =>
              kelurahan.toLowerCase().contains(query.toLowerCase()))
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
          "Nama Kelurahan",
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
            hintText: 'Pilih asal kelurahan kamu',
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
