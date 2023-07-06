import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/welcome_screen/components/login_button.dart';

import 'components/login_modal_bottom_sheet.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static String routeName = '/welcome_screen/';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: cColorPrimary50) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.fill,
                ),
                Container(
                  color: Colors.black.withAlpha(200),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 112,
                        right: 112,
                      ),
                      child: Image.asset('assets/images/techarealogosmall.png'),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    const Text(
                      'Shoparea.id',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      'Siap jualan dimana saja ,Jual pakai Shoparea.id',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFFF2F6FB)),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    LoginButton(
                      bgcolor: Colors.green,
                      press: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return const LoginBottomSheet();
                            });
                      },
                      text: 'Lanjutkan dengan nomor telfon',
                      textcolor: Colors.white,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    LoginButton(
                      bgcolor: Colors.white,
                      press: () {
                        Navigator.popAndPushNamed(context, '/initial_screen/');
                      },
                      text: 'Lanjutkan dengan google',
                      textcolor: Colors.black,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 28,
                          height: 32,
                          child: Image.asset('assets/images/icon_shield.png'),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '100%',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Kami tidak akan mengirimkan spam atau iklan\n ke nomor kamu',
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
