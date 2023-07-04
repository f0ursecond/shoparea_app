import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';
import 'package:shoparea_app/components/teks/text_field_with_counter.dart';
import 'package:shoparea_app/size_config.dart';

class AlamatPengirimanScreen extends StatelessWidget {
  const AlamatPengirimanScreen({super.key});
  static String routeName = '/alamat_pengirman/';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.black) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Alamat Pengiriman'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.green,
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(165)
                        : getProportionateScreenHeight(165),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(24)
                        : getProportionateScreenHeight(24),
                  ),
                  const TextFieldWithCounter(
                    maxChar: 100,
                    teksTitle: 'Alamat Bisnis',
                    teksHint: 'Masukan alamat bisnis kamu',
                    suffixIcon: Icons.arrow_drop_down_outlined,
                  ),
                  const TextFieldWithCounter(
                    teksTitle: 'Nama Provinsi',
                    teksHint: 'Masukan Nama Provinsi kamu',
                    suffixIcon: Icons.arrow_drop_down_outlined,
                  ),
                  const TextFieldWithCounter(
                    teksTitle: 'Nama Kecamatan',
                    teksHint: 'Masukan Nama Kecamatan kamu',
                    suffixIcon: Icons.arrow_drop_down_outlined,
                  ),
                  const TextFieldWithCounter(
                    teksTitle: 'Kelurahan / desa',
                    teksHint: 'Masukan Kelurahan  kamu',
                    suffixIcon: Icons.arrow_drop_down_outlined,
                  ),
                  const TextFieldWithCounter(
                    teksTitle: 'Kode Pos',
                    teksHint: 'Masukan Kode Pos kamu',
                    suffixIcon: Icons.arrow_drop_down_outlined,
                  ),
                  const TextFieldWithCounter(
                    maxChar: 100,
                    teksTitle: 'Catatan',
                    teksHint: 'Masukan Catatan kamu',
                    suffixIcon: Icons.arrow_drop_down_outlined,
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(24)
                        : getProportionateScreenHeight(24),
                  ),
                  DefaultButton(
                    press: () {
                      Navigator.pushNamed(context, '/add_account_bank/');
                    },
                    text: 'Simpan',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
