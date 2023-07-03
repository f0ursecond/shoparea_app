import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoparea_app/screen/welcome_screen/components/login_button.dart';
import 'package:shoparea_app/size_config.dart';

class VerificationBottomSheet extends StatefulWidget {
  const VerificationBottomSheet({
    super.key,
  });

  @override
  State<VerificationBottomSheet> createState() =>
      _VerificationBottomSheetState();
}

class _VerificationBottomSheetState extends State<VerificationBottomSheet> {
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
        child: Stack(
          children: [
            Transform(
              transform: Matrix4.translationValues(0, -60, 0),
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.arrow_back),
              ),
            ),
            CustomScrollView(
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
                    'Verifikasi nomor telepon kamu',
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
                const SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.only(
                        left: 24,
                        right: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OtpField(),
                          OtpField(),
                          OtpField(),
                          OtpField(),
                        ],
                      )),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 24,
                  ),
                ),
                const SliverToBoxAdapter(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Belum mendapatkan kode OTP ?'),
                    Text('Kirim Ulang OTP'),
                  ],
                )),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 8,
                  ),
                ),
                SliverToBoxAdapter(
                  child: LoginButton(
                    press: () {
                      Navigator.pushNamed(context, '/account_settings/');
                    },
                    text: 'Verifikasi nomor',
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
                    text: 'Verifikasi via SMS',
                    bgcolor: Colors.white,
                    textcolor: Colors.black,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 16,
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
          ],
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 53,
      height: 53,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }
}
