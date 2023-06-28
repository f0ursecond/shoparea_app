import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

class HistoryContent extends StatelessWidget {
  const HistoryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      height: 207,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pesan Kurir Toko',
                  style: TextStyle(
                    color: Color(0xFF808080),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'k22121',
                  style: TextStyle(
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
            const OrderStatus(),
            SizedBox(
              height: kIsWeb
                  ? getWebProportionateScreenHeight(16)
                  : getProportionateScreenHeight(16),
            ),
            const Text(
              'Keripik - Variasi Pedas',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              '16 Agu 2020 • 03:00 PM',
              style: TextStyle(
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
            const TotalPayment()
          ],
        ),
      ),
    );
  }
}

class TotalPayment extends StatelessWidget {
  const TotalPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Pembayaran',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              'Rp.80.000',
              style: TextStyle(
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
  });

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

bool orderStatus = false;

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102,
      height: 26,
      decoration: BoxDecoration(
        color: orderStatus ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: orderStatus
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
