// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:shoparea_app/consts/colors.dart";

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
        top: (16),
        bottom: (24),
        left: (16),
        right: (24),
      ),
      child: SizedBox(
        height: (32),
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (8),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: (5),
            horizontal: (16),
          ),
          margin: EdgeInsets.only(right: (8)),
          decoration: BoxDecoration(
            color: selectedIndex == index ? cColorPrimary50 : Colors.white,
            border: Border.all(
              width: selectedIndex == index ? 1 : 2,
              color: selectedIndex == index ? cColorPrimary50 : cColorNeutral50,
            ),
            borderRadius: BorderRadius.circular(
              (8),
            ),
          ),
          child: Text(
            categories[index],
            style: TextStyle(
              color: selectedIndex == index ? Colors.white : cColorExpired50,
              fontWeight:
                  selectedIndex == index ? FontWeight.bold : FontWeight.w400,
              fontSize: (12),
            ),
          ),
        ),
      ),
    );
  }
}
