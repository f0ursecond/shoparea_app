import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

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
