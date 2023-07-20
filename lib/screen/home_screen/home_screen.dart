import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/home_screen/components/analytics_button.dart';
import 'package:shoparea_app/screen/home_screen/components/navbar_content.dart';
import 'package:shoparea_app/screen/home_screen/components/preview_analytics.dart';
import 'package:shoparea_app/screen/home_screen/components/verification_ktp_widget.dart';
import 'package:shoparea_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routesName = '/home_screen/';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.transparent) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(184),
            child: SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  color: cColorPrimary50,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: const HomeAppBarContent(),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tombol Cepat',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(16)
                        : getProportionateScreenHeight(16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonFast(
                        icon: Icons.shopping_bag_outlined,
                        text: 'Tambah Produk',
                        press: () {
                          Navigator.pushNamed(context, '/add_product_screen/');
                        },
                      ),
                      ButtonFast(
                        icon: Icons.shopping_cart_outlined,
                        text: 'Buat Order',
                        press: () {
                          Navigator.pushNamed(context, '/make_order/');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(36)
                        : getProportionateScreenHeight(36),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ringkasan',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      AnalyticsButton(),
                    ],
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(24)
                        : getProportionateScreenHeight(24),
                  ),
                  const ShopAnalytics(),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(16)
                        : getProportionateScreenHeight(32),
                  ),
                  const VerificationKtpContainer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonFast extends StatelessWidget {
  const ButtonFast({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  final IconData icon;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      width: kIsWeb
          ? getWebProportionateScreenWidth(153)
          : getProportionateScreenWidth(153),
      height: kIsWeb
          ? getWebProportionateScreenHeight(53)
          : getProportionateScreenHeight(53),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: kIsWeb
                  ? getWebProportionateScreenWidth(8)
                  : getProportionateScreenWidth(8),
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
