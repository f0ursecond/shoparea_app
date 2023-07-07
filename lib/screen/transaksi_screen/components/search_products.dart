import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';

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
