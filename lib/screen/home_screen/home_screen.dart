import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
                  color: Colors.green,
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
              padding: const EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24,
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ringkasan',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF6DB5CB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: kIsWeb
                            ? getWebProportionateScreenWidth(153)
                            : getProportionateScreenWidth(153),
                        height: kIsWeb
                            ? getWebProportionateScreenHeight(53)
                            : getProportionateScreenHeight(53),
                        child: const Center(
                          child: Text(
                            'Cek Analitik Toko Kamu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
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
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFE9F0F8),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          Image.asset('assets/images/icon_verification.png'),
                          SizedBox(
                            width: kIsWeb
                                ? getWebProportionateScreenWidth(12)
                                : getProportionateScreenWidth(12),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Lakukan verifikasi KTP untuk\naktifkan semua akses penjualan di\ntokomu',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: kIsWeb
                                    ? getWebProportionateScreenHeight(20)
                                    : getProportionateScreenHeight(20),
                              ),
                              const Text(
                                'Siapkan KTP dan koneksi internet yang stabil',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                          const Expanded(
                            child: Icon(
                              Icons.arrow_right_sharp,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShopAnalytics extends StatelessWidget {
  const ShopAnalytics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kIsWeb
          ? getWebProportionateScreenHeight(205)
          : getProportionateScreenHeight(145),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        crossAxisCount: 2,
        children: const [
          SummaryContainer(
            title: 'Total Penjualan',
            subtitle: '20x',
          ),
          SummaryContainer(
            title: 'Total Pesanan',
            subtitle: '10x',
          ),
          SummaryContainer(
            title: 'Total Dilihat',
            subtitle: '20x',
          ),
          SummaryContainer(
            title: 'Total Produksi',
            subtitle: '10x',
          ),
        ],
      ),
    );
  }
}

class SummaryContainer extends StatelessWidget {
  const SummaryContainer({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFFE9F0F8),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(title),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )),
            const Expanded(
              flex: -1,
              child: Icon(
                Icons.arrow_right_sharp,
                color: Colors.green,
              ),
            )
          ],
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

class HomeAppBarContent extends StatelessWidget {
  const HomeAppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 24,
        right: 26,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hai\nWahyu Rizky',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              CircleAvatar(
                maxRadius: 28,
                backgroundColor: Colors.grey[200],
              ),
            ],
          ),
          SizedBox(
            height: kIsWeb
                ? getWebProportionateScreenHeight(16)
                : getProportionateScreenHeight(16),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[200],
              letterSpacing: 0.5,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
