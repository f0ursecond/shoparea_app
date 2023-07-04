import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';
import 'package:shoparea_app/components/teks/text_field_with_counter.dart';
import 'package:shoparea_app/size_config.dart';

class AddAccountBankScreen extends StatelessWidget {
  const AddAccountBankScreen({super.key});

  static String routeName = '/add_account_bank/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.black) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tambah Akun Bank'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Masukan detail akun bank anda',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut ',
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(24)
                      : getProportionateScreenHeight(24),
                ),
                SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(180)
                        : getProportionateScreenHeight(180),
                    width: kIsWeb
                        ? getWebProportionateScreenWidth(327)
                        : getProportionateScreenWidth(327),
                    child: const Placeholder()),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(24)
                      : getProportionateScreenHeight(24),
                ),
                const TextFieldWithCounter(
                  teksTitle: 'Nama Bank',
                  teksHint: 'Pilih Nama Bank anda',
                  suffixIcon: Icons.arrow_drop_down,
                ),
                const TextFieldWithCounter(
                  maxChar: 100,
                  teksTitle: 'Nomor Rekening',
                  teksHint: 'Pilih Nomor Rekening anda',
                  suffixIcon: Icons.arrow_drop_down,
                ),
                const Spacer(),
                DefaultButton(
                  press: () {
                    Navigator.pushNamed(context, '/settings_pin/');
                  },
                  text: 'Verifikasi',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
