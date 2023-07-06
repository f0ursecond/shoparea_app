import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';
import 'package:shoparea_app/components/teks/text_field_with_counter.dart';

class MakeOrderScreen extends StatelessWidget {
  const MakeOrderScreen({super.key});

  static String routeName = '/make_order/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Buat Order'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: Column(
              children: [
                const TextFieldWithCounter(
                  teksTitle: 'Informasi Pelanggan',
                  teksHint: 'Masukan data pelanggan',
                  suffixIcon: Icons.arrow_right,
                ),
                const TextFieldWithCounter(
                  teksTitle: 'Produk pesanan',
                  teksHint: 'Masukan data produk pesanan',
                  suffixIcon: Icons.arrow_right,
                ),
                const TextFieldWithCounter(
                  teksTitle: 'Informasi tambahan (opsional)',
                  teksHint: 'Masukan data pelanggan',
                  suffixIcon: Icons.arrow_right,
                ),
                const TextFieldWithCounter(
                  teksTitle: 'Catatan',
                  teksHint: 'Masukan catatan',
                  suffixIcon: Icons.arrow_right,
                  maxLength: 10,
                ),
                const Spacer(),
                DefaultButton(
                  press: () {},
                  text: 'Selanjutnya',
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
