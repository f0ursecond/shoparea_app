// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';

import '../size_config.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int counter; // Tambahkan variabel counter di sini

  final ValueChanged<int> onChanged;

  NumericStepButton({
    Key? key,
    this.minValue = 0,
    required this.counter,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
  late TextEditingController counterController;
  late int counter;

  @override
  void initState() {
    super.initState();
    counter = widget.counter;
    counterController = TextEditingController(text: counter.toString());
  }

  @override
  void dispose() {
    counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: kIsWeb
              ? getWebProportionateScreenWidth(20)
              : getProportionateScreenWidth(20),
          width: kIsWeb
              ? getWebProportionateScreenWidth(20)
              : getProportionateScreenWidth(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            border: Border.all(color: cColorPrimary50),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.remove,
              color: cColorPrimary50,
              size: kIsWeb
                  ? getWebProportionateScreenWidth(14)
                  : getProportionateScreenWidth(14),
            ),
            onPressed: () {
              setState(() {
                if (counter > widget.minValue) {
                  counter--;
                  counterController.text = counter.toString();
                }
                widget.onChanged(counter);
              });
            },
          ),
        ),
        Spacer(),
        Text(
          counterController
              .text, // Gunakan nilai dari controller sebagai teks counter
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(12)
                : getProportionateScreenWidth(12),
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Container(
          height: kIsWeb
              ? getWebProportionateScreenWidth(20)
              : getProportionateScreenWidth(20),
          width: kIsWeb
              ? getWebProportionateScreenWidth(20)
              : getProportionateScreenWidth(20),
          decoration: BoxDecoration(
            color: cColorPrimary50,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: kIsWeb
                  ? getWebProportionateScreenWidth(14)
                  : getProportionateScreenWidth(14),
            ),
            onPressed: () {
              setState(() {
                counter++;
                counterController.text = counter.toString();
                widget.onChanged(counter);
              });
            },
          ),
        ),
      ],
    );
  }
}
