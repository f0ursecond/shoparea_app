// ignore_for_file: prefer_const_constructors

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:shoparea_app/consts/colors.dart";

import "../../../../size_config.dart";

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Semua Kategori",
    "Lorem",
    "Ipsum",
    "Dolor",
    "Sit",
    "Ipsum",
    "Dolor",
    "Ipsum",
    "Dolor",
  ];

  // by default, our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: kIsWeb
            ? getWebProportionateScreenWidth(8)
            : getProportionateScreenWidth(8),
        bottom: kIsWeb
            ? getWebProportionateScreenWidth(16)
            : getProportionateScreenWidth(16),
      ),
      child: SizedBox(
        height: kIsWeb
            ? getWebProportionateScreenWidth(28)
            : getProportionateScreenWidth(28),
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: kIsWeb
              ? getWebProportionateScreenWidth(5)
              : getProportionateScreenWidth(5),
          horizontal: kIsWeb
              ? getWebProportionateScreenWidth(16)
              : getProportionateScreenWidth(16),
        ),
        margin: EdgeInsets.only(
          right: kIsWeb
              ? getWebProportionateScreenWidth(8)
              : getProportionateScreenWidth(8),
        ),
        decoration: BoxDecoration(
          color: selectedIndex == index ? cColorPrimary50 : Colors.white,
          border: Border.all(
            width: selectedIndex == index ? 1 : 2,
            color: selectedIndex == index ? cColorPrimary50 : cColorNeutral50,
          ),
          borderRadius: BorderRadius.circular(
            kIsWeb
                ? getWebProportionateScreenWidth(4)
                : getProportionateScreenWidth(4),
          ),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : cColorExpired50,
            fontWeight:
                selectedIndex == index ? FontWeight.bold : FontWeight.w400,
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(12)
                : getProportionateScreenWidth(12),
          ),
        ),
      ),
    );
  }
}
