import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/size_config.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static String routeName = '/welcome_screen/';

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
                      press: () {},
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

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 500,
          minWidth: double.infinity,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenHeight(5)
                    : getProportionateScreenHeight(5),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 3,
                  left: 170.5,
                  right: 170.5,
                ),
                child: Container(
                  width: 34,
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenHeight(30)
                    : getProportionateScreenHeight(10),
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'Silahkan masukan nomor\n telepon kamu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do e',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixText: '+62',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: LoginButton(
                press: () {},
                text: 'Verifikasi dengan Whatsapp',
                bgcolor: Colors.green,
                textcolor: Colors.white,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: LoginButton(
                press: () {},
                text: 'Verifikasi dengan SMS',
                bgcolor: Colors.white,
                textcolor: Colors.black,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (_) {},
                    ),
                    const Text(
                      'Saya setuju dengan Syarat dan Ketentuan di\nShoparea.id',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
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
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                textAlign: TextAlign.center,
                'Kami tidak akan mengirimkan spam atau iklan\n ke nomor kamu',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.press,
    required this.text,
    required this.bgcolor,
    this.icon,
    required this.textcolor,
  });

  final VoidCallback press;
  final String text;
  final Color bgcolor;
  final Color textcolor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        width: kIsWeb ? 400.0 : double.infinity,
        height: kIsWeb ? 48.0 : 48.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgcolor,
          ),
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: textcolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
