import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

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
              color: const Color(0xFF2DBE78),
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
