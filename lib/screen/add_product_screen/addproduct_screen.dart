import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/default_button.dart';
import 'package:shoparea_app/components/teks/text_field_with_counter.dart';
import 'package:shoparea_app/size_config.dart';

enum Stock { ready, limited }

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  static String routeName = '/add_product_screen/';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Stock? _character = Stock.ready;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.black) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tambah Produk'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Foto produk (optional)',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const TextFieldWithCounter(
                    maxChar: 100,
                    teksTitle: 'Nama Produk *',
                    teksHint: 'Contoh : sate sapi',
                  ),
                  const TextFieldWithCounter(
                    teksTitle: 'Kategori Produk (optional)',
                    teksHint: 'Contoh : Makanan,Minuman',
                  ),
                  const TextFieldWithCounter(
                    teksTitle: 'Harga Produk *',
                    teksHint: 'Contoh : 50.000',
                  ),
                  const TextFieldWithCounter(
                    teksTitle: 'Deskripsi (optional)',
                    teksHint: 'Contoh : 50.000',
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        const ReadyStock(
                          title: 'Stok Terbatas',
                        ),
                        Expanded(
                          child: Radio<Stock>(
                            value: Stock.ready,
                            groupValue: _character,
                            onChanged: (Stock? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        const ReadyStock(
                          title: 'Stok Tersedia',
                        ),
                        Expanded(
                          child: Radio<Stock>(
                            value: Stock.limited,
                            groupValue: _character,
                            onChanged: (Stock? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Variasi (optional)',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                            'Lorem ipsum is placeholder text commonly used in the graphic'),
                      ],
                    ),
                  ),
                  Container(
                    width: 118,
                    height: 23,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.green),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.add),
                        Text(
                          'Tambah Variasi',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(24)
                        : getProportionateScreenHeight(24),
                  ),
                  DefaultButton(
                      press: () {
                        Navigator.pushNamed(
                          context,
                          '/pengaturan_pengiriman/',
                        );
                      },
                      text: 'Tambah Produk'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReadyStock extends StatelessWidget {
  const ReadyStock({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
              'Lorem ipsum is placeholder text commonly used in the graphic'),
        ],
      ),
    );
  }
}
