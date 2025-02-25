// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/welcome_screen/components/login_button.dart';
import 'package:shoparea_app/screen/welcome_screen/components/verification_bottom_sheet.dart';
import 'package:shoparea_app/size_config.dart';

class LoginWithNumberBottomSheet extends StatefulWidget {
  const LoginWithNumberBottomSheet({
    super.key,
  });

  @override
  State<LoginWithNumberBottomSheet> createState() =>
      _LoginWithNumberBottomSheetState();
}

final formKey = GlobalKey<FormState>();
final phoneController = TextEditingController();

class _LoginWithNumberBottomSheetState
    extends State<LoginWithNumberBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Padding(
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
                  child: CustomTextField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor Telfon Harus Diisi';
                      }
                      return null;
                    },
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
                  press: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pop(context);
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
                            return const VerificationBottomSheet();
                          });
                    } else {
                      print('Phone Number Can' 't by empty');
                    }
                  },
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
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;
  final FormFieldValidator validator;

  final inpuTextStyle = TextStyle(
    color: cColorShadesBlack,
    fontWeight: FontWeight.w400,
    fontSize: kIsWeb
        ? getWebProportionateScreenWidth(14)
        : getProportionateScreenWidth(14),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: inpuTextStyle,
      maxLines: 1,
      controller: controller,
      validator: validator,
      maxLength: 100,
      decoration: InputDecoration(
        prefixText: '+62',
        prefixStyle: inpuTextStyle,
        contentPadding: const EdgeInsets.only(
          left: 10,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: cColorError50),
        ),
        counterStyle: const TextStyle(
          height: double.minPositive,
        ),
        suffixStyle: const TextStyle(
          fontSize: 12,
          height: 1,
        ),
        counter: const SizedBox.shrink(),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: cColorPrimary10),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: cColorNeutral70),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: cColorError50),
        ),
        hintStyle: TextStyle(
          color: cColorExpired30,
          fontWeight: FontWeight.w400,
          fontSize: kIsWeb
              ? getWebProportionateScreenWidth(12)
              : getProportionateScreenWidth(12),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
