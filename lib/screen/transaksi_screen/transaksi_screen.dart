import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/front_store/components/categories/categories.dart';
import 'package:shoparea_app/screen/transaksi_screen/components/container_cart.dart';
import 'package:shoparea_app/screen/transaksi_screen/components/search_products.dart';
import 'package:shoparea_app/size_config.dart';

class TransaksiScreen extends StatefulWidget {
  const TransaksiScreen({super.key});

  static String routeName = '/transaksi_screen/';

  @override
  State<TransaksiScreen> createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  final initialDate = DateTime.now();

  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.transparent) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Pesanan'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
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
              children: [
                const SearchProduct(),
                const Categories(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pesananmu',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Chip(
                      onDeleted: () {
                        showDatePicker(
                          context: context,
                          initialDate: initialDate,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2024),
                        );
                      },
                      deleteIcon: const Icon(Icons.arrow_drop_down),
                      label: const Text('7 Hari Terakhir'),
                    ),
                  ],
                ),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(24)
                      : getProportionateScreenHeight(24),
                ),
                Expanded(
                  child: SizedBox(
                    child: isEmpty
                        ? const EmptyOrder()
                        : ListView.separated(
                            itemCount: 5,
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.grey[500],
                            ),
                            itemBuilder: (context, index) {
                              return const CartContainer();
                            },
                          ),
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
