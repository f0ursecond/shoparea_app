import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/total_penjualan_screen/components/charts.dart';
import 'package:shoparea_app/size_config.dart';

class TotalSalesScreen extends StatelessWidget {
  const TotalSalesScreen({super.key});

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
                BarChartSample6(),
                SizedBox(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(24)
                      : getProportionateScreenHeight(24),
                ),
                Container(
                  color: cColorNeutral30,
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(138)
                      : getProportionateScreenHeight(138),
                  child: const Column(
                    children: [
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.info,
                          color: cColorPrimary50,
                        ),
                        title: Text(
                            'untuk informasi lanjut silahkan scroll  ke kanan dan ke kiri  '),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.info,
                          color: cColorPrimary50,
                        ),
                        title: Text(
                            'hold blue bar untuk mengetahui data keseluruhan di hari tersebut'),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.info,
                          color: cColorPrimary50,
                        ),
                        title: Text(
                            'click blue bar untuk mengetahui data lebih spesifik di hari tersebut'),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const TotalPenjualanSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TotalPenjualanSection extends StatelessWidget {
  const TotalPenjualanSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '7 Feb - 14 Feb 2023',
            style: TextStyle(
                color: cColorNeutralBlack50,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total data penjualan'),
              Text(
                '10x',
                style: TextStyle(
                  color: cColorPrimary50,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
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
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          const Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistics',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text('7 Feb - 14 Feb 2023 '),
                ],
              )),
          Expanded(
            flex: -1,
            child: Chip(
              onDeleted: () {},
              backgroundColor: const Color(0xFF6DB5CB),
              deleteIcon: const Icon(Icons.arrow_drop_down),
              label: const Text('7 Hari terakhir'),
            ),
          ),
        ],
      ),
    );
  }
}
