import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';
import 'package:shoparea_app/size_config.dart';

class ModalBottomSheetContent extends StatelessWidget {
  const ModalBottomSheetContent({
    super.key,
    required this.title,
    required this.hinttext,
    required this.textbtn,
  });

  final String title;
  final String hinttext;
  final String textbtn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kIsWeb
          ? getWebProportionateScreenHeight(380)
          : getProportionateScreenHeight(380),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do e',
            ),
            SizedBox(
              height: kIsWeb
                  ? getWebProportionateScreenHeight(24)
                  : getProportionateScreenHeight(24),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: hinttext,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: kIsWeb
                  ? getWebProportionateScreenHeight(24)
                  : getProportionateScreenHeight(24),
            ),
            DefaultButton(press: () {}, text: 'Gunakan sebagai $textbtn'),
          ],
        ),
      ),
    );
  }
}
