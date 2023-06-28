import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/front_store/components/categories/categories.dart';
import 'package:shoparea_app/size_config.dart';

class TransaksiScreen extends StatefulWidget {
  const TransaksiScreen({super.key});

  static String routeName = '/transaksi_screen/';

  @override
  State<TransaksiScreen> createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.transparent) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: SafeArea(
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pesananmu',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Chip(
                        label: Row(
                          children: [
                            Text('7 Hari Terakhir'),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
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
      ),
    );
  }
}

class SearchProduct extends StatelessWidget {
  const SearchProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: cColorPrimary10),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: cColorNeutral70),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: cColorError50),
        ),
        hintText: 'Mau cari apa?',
        hintStyle: const TextStyle(
          color: cColorExpired30,
          fontWeight: FontWeight.w400,
          fontSize: (12),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}

class CartContainer extends StatelessWidget {
  const CartContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 113,
      child: Row(
        children: [
          Image.asset(
            'assets/images/laptop.png',
            width: 78,
            height: 55,
          ),
          SizedBox(
            width: kIsWeb
                ? getWebProportionateScreenWidth(24)
                : getProportionateScreenWidth(24),
          ),
          const Expanded(
            child: ProductDescription(),
          ),
          const VerticalDivider(),
          const ProductPriceAndQty()
        ],
      ),
    );
  }
}

class ProductPriceAndQty extends StatelessWidget {
  const ProductPriceAndQty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jumlah',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
        Text(
          '2 Item',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        Text(
          'Rp.10.000.000',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Pesanan Baru',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
        SizedBox(
          height: kIsWeb
              ? getWebProportionateScreenHeight(8)
              : getProportionateScreenHeight(8),
        ),
        const Text(
          'Laptop RTX',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: kIsWeb
              ? getWebProportionateScreenHeight(8)
              : getProportionateScreenHeight(8),
        ),
        const Text(
          'Berat : 100 gram',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
        SizedBox(
          height: kIsWeb
              ? getWebProportionateScreenHeight(8)
              : getProportionateScreenHeight(8),
        ),
        const Text(
          'Varian : Pedas',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
        SizedBox(
          height: kIsWeb
              ? getWebProportionateScreenHeight(8)
              : getProportionateScreenHeight(8),
        ),
        Container(
          width: 68,
          height: 18,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF2DBE78),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Center(
            child: Text(
              'Kurir toko',
              style: TextStyle(
                color: Colors.green,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/support.png',
          width: kIsWeb
              ? getWebProportionateScreenWidth(327)
              : getProportionateScreenWidth(326),
          height: kIsWeb
              ? getWebProportionateScreenHeight(150)
              : getProportionateScreenWidth(150),
        ),
        const Text(
          textAlign: TextAlign.center,
          'Kosong',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          textAlign: TextAlign.center,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ',
        ),
      ],
    );
  }
}
