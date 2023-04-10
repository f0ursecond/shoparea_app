import 'package:flutter/material.dart';

class ItemProductKeranjang extends StatelessWidget {
  const ItemProductKeranjang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        kIsWeb
            ? getWebProportionateScreenWidth(16)
            : getProportionateScreenWidth(16),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: cColorNeutral50),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/sepatu_merah.png",
            height: kIsWeb
                ? getWebProportionateScreenWidth(75)
                : getProportionateScreenWidth(75),
            width: kIsWeb
                ? getWebProportionateScreenWidth(75)
                : getProportionateScreenWidth(75),
          ),
          SizedBox(
            width: kIsWeb
                ? getWebProportionateScreenWidth(8)
                : getProportionateScreenWidth(8),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sepatu layang",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: kIsWeb
                        ? getWebProportionateScreenWidth(10)
                        : getProportionateScreenWidth(10),
                    fontWeight: FontWeight.w400,
                    color: cColorNeutralBlack50),
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(8)
                    : getProportionateScreenWidth(8),
              ),
              Text(
                "Rp 100.000.00",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: kIsWeb
                        ? getWebProportionateScreenWidth(14)
                        : getProportionateScreenWidth(14),
                    fontWeight: FontWeight.w700,
                    color: cColorError50),
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(8)
                    : getProportionateScreenWidth(8),
              ),
              Row(
                children: [
                  Text(
                    "Variasi",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: kIsWeb
                            ? getWebProportionateScreenWidth(10)
                            : getProportionateScreenWidth(10),
                        fontWeight: FontWeight.w400,
                        color: cColorNeutralBlack50),
                  ),
                  SizedBox(
                    width: kIsWeb
                        ? getWebProportionateScreenWidth(8)
                        : getProportionateScreenWidth(8),
                  ),
                  OutlinedButton50(
                    text: "Edit",
                    height: kIsWeb
                        ? getWebProportionateScreenWidth(28)
                        : getProportionateScreenWidth(28),
                    press: () {},
                    width: kIsWeb
                        ? getWebProportionateScreenWidth(55)
                        : getProportionateScreenWidth(55),
                  )
                ],
              ),
              SizedBox(
                height: kIsWeb
                    ? getWebProportionateScreenWidth(8)
                    : getProportionateScreenWidth(8),
              ),
              Text(
                "(Warna Kuning, Ukuran L)",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: kIsWeb
                        ? getWebProportionateScreenWidth(8)
                        : getProportionateScreenWidth(8),
                    fontWeight: FontWeight.w400,
                    color: cColorExpired50),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: kIsWeb
                ? getWebProportionateScreenWidth(65)
                : getProportionateScreenWidth(65),
            child: NumericStepButton(
              minValue: 1,
              // maxValue: 20,

              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
