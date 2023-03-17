// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/size_config.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;

  final ValueChanged<int> onChanged;

  NumericStepButton(
      {Key? key,
      this.minValue = 0,
      // this.maxValue = 10,
      required this.onChanged})
      : super(key: key);

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
  int counter = 1;
  TextEditingController counterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: getProportionateScreenWidth(24),
          width: getProportionateScreenWidth(24),
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
            ),
            onPressed: () {
              setState(() {
                if (counter > widget.minValue) {
                  counter--;
                }
                widget.onChanged(counter);
              });
            },
          ),
        ),
        Text(
          '$counter',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(14),
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          height: getProportionateScreenWidth(24),
          width: getProportionateScreenWidth(24),
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
            ),
            onPressed: () {
              setState(() {
                counter++;

                widget.onChanged(counter);
              });
            },
          ),
        ),
      ],
    );
  }
}
