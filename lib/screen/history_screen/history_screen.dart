import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/history_screen/components/history_card_item.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  static String routeName = '/history_screen/';

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

List<Map<String, dynamic>> history = [
  {
    "kurir": "JNE",
    "resi": "13123w132",
    "status": false,
    "productName": "Keripik Variasi- Pedas",
    "date": "16 Agu 2020 • 03:00 PM",
    "totalPrice": "Rp 70.000",
  },
  {
    "kurir": "GRAB",
    "resi": "GRAB-e191312",
    "status": true,
    "productName": "Laptop  - RTX",
    "date": "11 Agu 2024 • 03:00 PM",
    "totalPrice": "Rp 18.070.000",
  },
  {
    "kurir": "Ambil Sendiri",
    "resi": "01931092",
    "status": true,
    "productName": "Sepatu - Adidas Advantage Base",
    "date": "11 Sep 2020 • 01:00 AM",
    "totalPrice": "Rp 750.000",
  },
  {
    "kurir": "Pesan Kurir Toko",
    "resi": "2313923",
    "status": false,
    "productName": "Kipas Angin",
    "date": "21 Oct 2020 • 13:00 PM",
    "totalPrice": "Rp 550.000",
  },
  {
    "kurir": "J&T",
    "resi": "0192293212",
    "status": true,
    "productName": "Stik PS3",
    "date": "11 Sep 2020 • 04:00 AM",
    "totalPrice": "Rp 250.000",
  },
];

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.transparent) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('History'),
            automaticallyImplyLeading: false,
            actions: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.notifications)),
                ],
              ),
            ],
          ),
          body: SizedBox(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      bottom: 0,
                      left: 0,
                    ),
                  );
                },
                itemCount: history.length,
                itemBuilder: (context, index) {
                  var products = history[index];
                  return HistoryCardItem(products: products);
                }),
          ),
        ),
      ),
    );
  }
}
