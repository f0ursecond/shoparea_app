import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';
import 'package:shoparea_app/screen/welcome_screen/components/verification_bottom_sheet.dart';
import 'package:shoparea_app/size_config.dart';

class PinSettingsScreen extends StatelessWidget {
  const PinSettingsScreen({super.key});

  static String routeName = '/settings_pin/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.black) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Atur Kode Pin'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 114,
                  height: 45,
                  color: Colors.green,
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(24)
                      : getProportionateScreenHeight(24),
                ),
                const Text(
                  '1212121112',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Bank Muamalat | Wahyu Rizqy Saputra',
                ),
                const Divider(),
                const Text(
                  'Amankan akun anda dengan 5 digit kode pin ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(24)
                      : getProportionateScreenHeight(24),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OtpField(),
                    OtpField(),
                    OtpField(),
                    OtpField(),
                    OtpField(),
                  ],
                ),
                const Spacer(
                  flex: 4,
                ),
                DefaultButton(
                  press: () {
                    Navigator.pushNamed(context, '/make_order/');
                  },
                  text: 'Buat kode pin',
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
