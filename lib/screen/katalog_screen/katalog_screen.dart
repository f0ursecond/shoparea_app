import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

class KatalogScreen extends StatelessWidget {
  const KatalogScreen({super.key});

  static String routeName = '/katalog_screen/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.transparent) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: const Text('Katalog'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lorem Ipsum Dolor Sir Amet',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(8)
                      : getProportionateScreenHeight(8),
                ),
                const Text(
                    'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod'),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(24.62)
                      : getProportionateScreenHeight(24.62),
                ),
                Expanded(
                    child: Column(
                  children: [
                    KatalogContainer(
                      title: 'Buat Produk Baru',
                      subtitle: 'Lorem Ipsum Dolor Sir Amet',
                      press: () {},
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? getWebProportionateScreenHeight(24.62)
                          : getProportionateScreenHeight(24.62),
                    ),
                    KatalogContainer(
                      title: 'Buat Promosi Produk ',
                      subtitle: 'Lorem Ipsum Dolor Sir Amet',
                      press: () {
                        Navigator.pushNamed(context, '/add_promosi_produk/');
                      },
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KatalogContainer extends StatelessWidget {
  const KatalogContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.press,
  });

  final String title;
  final String subtitle;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        height: 89,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset(
                'assets/images/message.png',
                width: 78,
                height: 55,
              ),
              SizedBox(
                width: kIsWeb
                    ? getWebProportionateScreenWidth(18)
                    : getProportionateScreenWidth(18),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(8)
                        : getProportionateScreenHeight(8),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: Icon(
                  Icons.arrow_right_sharp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
