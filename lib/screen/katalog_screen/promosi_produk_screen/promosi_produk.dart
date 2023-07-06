import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/front_store/components/categories/categories.dart';
import 'package:shoparea_app/size_config.dart';

class PromosiProductScreen extends StatefulWidget {
  const PromosiProductScreen({super.key});

  static String routeName = '/add_promosi_produk/';

  @override
  State<PromosiProductScreen> createState() => _PromosiProductScreenState();
}

class _PromosiProductScreenState extends State<PromosiProductScreen> {
  bool isChecked = false;

  List<Map<String, dynamic>> product = [
    {
      "image": "assets/images/laptop.png",
      "productName": "Laptop GTX",
      "productPrice": "Rp. 12.000.000",
    },
    {
      "image": "assets/images/laptop.png",
      "productName": "Laptop RTX",
      "productPrice": "Rp. 30.000.000",
    },
    {
      "image": "assets/images/laptop.png",
      "productName": "Laptop Radeon",
      "productPrice": "Rp. 20.000.000",
    },
    {
      "image": "assets/images/laptop.png",
      "productName": "Laptop Kentang",
      "productPrice": "Rp. 4.000.000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: kIsWeb ? 400 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Promosi produk'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: Column(
              children: [
                const Text(
                  'Masukan diskon ke produk',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(8)
                      : getProportionateScreenHeight(8),
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const Categories(),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, index) {
                      return const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      );
                    },
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      var products = product[index];
                      return ListTile(
                        leading: Image.asset(
                          products['image'],
                          width: 78,
                          height: 55,
                        ),
                        title: Text(
                          products['productName'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          products['productPrice'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                        trailing: Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
