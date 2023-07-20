import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/history_screen/components/order_status_widget.dart';
import 'package:shoparea_app/screen/history_screen/components/total_pembayaran_widget.dart';
import 'package:shoparea_app/size_config.dart';

class HistoryCardItem extends StatelessWidget {
  const HistoryCardItem({
    super.key,
    required this.products,
  });

  final Map<String, dynamic> products;

  @override
  Widget build(BuildContext context) {
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
                      color: cColorNeutral90,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    products['resi'],
                    style: const TextStyle(
                      color: cColorNeutral90,
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
              OrderStatusWidget(
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
              TotalPaymentWidget(
                price: products['totalPrice'],
              )
            ],
          ),
        ),
      ),
    );
  }
}
