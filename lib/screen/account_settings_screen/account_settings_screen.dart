import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';
import 'package:shoparea_app/components/teks/text_field_with_counter.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/account_settings_screen/components/modal_bottom_sheet_content.dart';
import 'package:shoparea_app/size_config.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  static String routeName = '/account_settings/';

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: cColorPrimary50) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pengaturan Akun'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                left: 24,
                right: 24,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Selamat datang di Shoparea.id',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(16)
                        : getProportionateScreenHeight(16),
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor incididunt\nut labore et dolore magna aliqua',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(26)
                        : getProportionateScreenHeight(26),
                  ),
                  TextFieldWithCounter(
                    teksTitle: 'Nama Toko',
                    teksHint: 'Masukan nama toko kamu',
                    maxChar: 10,
                    ontap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return const ModalBottomSheetContent(
                              title: 'Rekomendasi nama toko kamu',
                              hinttext: 'Cari nama toko kamu',
                              textbtn: 'nama toko',
                            );
                          });
                    },
                  ),
                  TextFieldWithCounter(
                    teksTitle: 'Kategori',
                    teksHint: 'Pilih tipe bisnis kamu',
                    suffixIcon: Icons.arrow_drop_down,
                    ontap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return const ModalBottomSheetContent(
                              title: 'Kategori Bisnis',
                              hinttext: 'Cari kategori bisnis kamu',
                              textbtn: 'kategori bisnis',
                            );
                          });
                    },
                  ),
                  const TextFieldWithCounter(
                    teksTitle: 'Nama Bisnis',
                    teksHint: 'Masukan nama toko kamu',
                    maxChar: 10,
                  ),
                  TextFieldWithCounter(
                    teksTitle: 'Nama Provinsi',
                    teksHint: 'Pilih asal kota kamu',
                    suffixIcon: Icons.arrow_drop_down,
                    ontap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return const ModalBottomSheetContent(
                              title: 'Nama provinsi kamu',
                              hinttext: 'Cari nama provinsi kamu',
                              textbtn: 'nama provinsi',
                            );
                          });
                    },
                  ),
                  TextFieldWithCounter(
                    teksTitle: 'Nama kota',
                    teksHint: 'Pilih asal kecamatan kamu',
                    suffixIcon: Icons.arrow_drop_down,
                    ontap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return const ModalBottomSheetContent(
                              title: 'Nama kecamatan',
                              hinttext: 'Cari nama kecamatan kamu',
                              textbtn: 'nama kecamatan',
                            );
                          });
                    },
                  ),
                  TextFieldWithCounter(
                    teksTitle: 'Kode pos',
                    teksHint: 'Pilih asal kode pos kamu',
                    suffixIcon: Icons.arrow_drop_down,
                    ontap: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return const ModalBottomSheetContent(
                              title: 'Kode Pos kamu',
                              hinttext: 'Cari kode pos kamu',
                              textbtn: 'kode pos',
                            );
                          });
                    },
                  ),
                  const TextFieldWithCounter(
                    teksTitle: 'Nomor Whatsapp',
                    teksHint: '+6289182193232',
                  ),
                  showPhoneNumberSwitch(),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(24)
                        : getProportionateScreenHeight(24),
                  ),
                  const Divider(
                    thickness: 1,
                    color: cColorExpired30,
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(24)
                        : getProportionateScreenHeight(24),
                  ),
                  DefaultButton(
                    text: 'Lanjut',
                    press: () {
                      Navigator.popAndPushNamed(context, '/initial_screen/');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox showPhoneNumberSwitch() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              FlutterSwitch(
                activeColor: Colors.green,
                value: status,
                onToggle: (value) {
                  setState(() {
                    status = value;
                  });
                },
                borderRadius: 30,
                width: 46,
                height: 26,
              ),
              SizedBox(
                width: kIsWeb
                    ? getWebProportionateScreenWidth(16)
                    : getProportionateScreenWidth(16),
              ),
              const Text(
                'Tampilkan Nomor telepon di toko saya',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: kIsWeb
                ? getWebProportionateScreenHeight(8)
                : getProportionateScreenHeight(8),
          ),
          const Text(
            'Ut enim ad minim veniam, quis nostrud exercitation\nullamco laboris nisi ut aliquip ex ea commodo consequat',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
