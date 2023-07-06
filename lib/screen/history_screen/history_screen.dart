import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shoparea_app/size_config.dart';

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
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 12,
                      bottom: 10,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  products['kurir'],
                                  style: const TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  products['resi'],
                                  style: const TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: kIsWeb
                                  ? getWebProportionateScreenHeight(12)
                                  : getProportionateScreenHeight(12),
                            ),
                            OrderStatus(
                              orderStatus: products['status'],
                            ),
                            SizedBox(
                              height: kIsWeb
                                  ? getWebProportionateScreenHeight(16)
                                  : getProportionateScreenHeight(16),
                            ),
                            Text(
                              products['productName'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              products['date'],
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: kIsWeb
                                  ? getWebProportionateScreenHeight(12)
                                  : getProportionateScreenHeight(12),
                            ),
                            TotalPayment(
                              price: products['totalPrice'],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class TotalPayment extends StatelessWidget {
  const TotalPayment({
    super.key,
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Pembayaran',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Lihat Detail',
          ),
        )
      ],
    );
  }
}

class OrderStatus extends StatefulWidget {
  const OrderStatus({
    super.key,
    required this.orderStatus,
  });

  final bool orderStatus;
  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102,
      height: 26,
      decoration: BoxDecoration(
        color: widget.orderStatus ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: widget.orderStatus
            ? const Text(
                'Pesanan Selesai',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            : const Text(
                'Pesanan Gagal',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
