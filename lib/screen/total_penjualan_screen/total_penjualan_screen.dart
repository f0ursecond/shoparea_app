import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/total_penjualan_screen/components/charts.dart';
import 'package:shoparea_app/size_config.dart';

class TotalPenjualanScreen extends StatelessWidget {
  const TotalPenjualanScreen({super.key});

  static String routeName = '/total_penjualan/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.black) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Penjualan'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: Column(
              children: [
                const StatistikContainer(),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(24)
                      : getProportionateScreenHeight(24),
                ),
                Expanded(
                  child: BarChartSample6(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatistikContainer extends StatelessWidget {
  const StatistikContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Statistik'),
                  Text('7 Feb - 14 Feb 2023 '),
                ],
              )),
          Expanded(
            flex: -1,
            child: Chip(
              label: Text('7 Hari terakhir'),
            ),
          ),
        ],
      ),
    );
  }
}
