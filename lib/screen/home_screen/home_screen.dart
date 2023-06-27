import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shoparea_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.transparent) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(184),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonFast(
                        icon: Icons.shopping_bag_outlined,
                        text: 'Tambah Produk',
                      ),
                      ButtonFast(
                        icon: Icons.shopping_cart_outlined,
                        text: 'Buat Order',
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
                  SizedBox(
                    height: 140,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      childAspectRatio: 5 / 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: const Text("Total Penjualan")),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: const Text("Total Pesanan")),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: const Text("Total Dilihat")),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: const Text("Total Produksi")),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(16)
                        : getProportionateScreenHeight(16),
                  ),
                  Container(
                    height: 150,
                    color: Colors.grey[400],
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

class ButtonFast extends StatelessWidget {
  const ButtonFast({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      width: kIsWeb
          ? getWebProportionateScreenWidth(153)
          : getProportionateScreenWidth(153),
      height: kIsWeb
          ? getWebProportionateScreenHeight(53)
          : getProportionateScreenHeight(53),
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
