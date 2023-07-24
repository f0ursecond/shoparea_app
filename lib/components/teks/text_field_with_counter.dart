// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';

import '../../consts/colors.dart';
import '../../size_config.dart';

class TextFieldWithCounter extends StatefulWidget {
  final String teksTitle;
  final String? teksHint;
  final int? maxChar;
  final IconData? suffixIcon;
  final VoidCallback? ontap;
  final int? maxLength;
  final TextInputType? txtInputType;
  final TextEditingController? controller;

  const TextFieldWithCounter({
    Key? key,
    required this.teksTitle,
    this.teksHint,
    this.maxChar,
    this.suffixIcon,
    this.ontap,
    this.maxLength,
    this.txtInputType,
    this.controller,
  }) : super(key: key);

  @override
  _TextFieldWithCounterState createState() => _TextFieldWithCounterState();
}

class _TextFieldWithCounterState extends State<TextFieldWithCounter> {
  final TextEditingController _controller = TextEditingController();

  get teksTitle => widget.teksTitle;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateCharCount);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateCharCount);
    _controller.dispose();
    super.dispose();
  }

  void _updateCharCount() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              teks: widget.teksTitle,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              teksColor: cColorNeutralBlack50,
            ),
            Visibility(
              visible: widget.maxChar == null ? false : true,
              child: CustomText(
                teks: '${_controller.text.length} / ${widget.maxChar}',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                teksColor: cColorNeutral70,
              ),
            ),
          ],
        ),
        SizedBox(
          height: kIsWeb
              ? getWebProportionateScreenWidth(8)
              : getProportionateScreenWidth(8),
        ),
        Container(
          height: kIsWeb
              ? getWebProportionateScreenWidth(74)
              : getProportionateScreenWidth(74),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: TextFormField(
            validator: checkFieldEmpty,
            maxLines: widget.maxLength ?? 1,
            onTap: widget.ontap,
            controller: widget.controller,
            maxLength: 100,
            decoration: InputDecoration(
              suffixIcon: Icon(widget.suffixIcon),
              counterStyle: TextStyle(
                height: double.minPositive,
              ),
              suffixStyle: TextStyle(
                fontSize: 12,
                height: 1,
              ),
              counter: SizedBox.shrink(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: cColorPrimary10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: cColorNeutral70),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: cColorError50),
              ),
              hintText: widget.teksHint,
              hintStyle: TextStyle(
                color: cColorExpired30,
                fontWeight: FontWeight.w400,
                fontSize: kIsWeb
                    ? getWebProportionateScreenWidth(12)
                    : getProportionateScreenWidth(12),
              ),
            ),
            keyboardType: widget.txtInputType ?? TextInputType.text,
          ),
        ),
      ],
    );
  }

  String? checkFieldEmpty(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Field Tidak Boleh Kosong';
    }
    return null;
  }
}
