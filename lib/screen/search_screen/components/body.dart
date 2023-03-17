// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/screen/search_screen/components/item_listview_product/item_listview_product.dart';
import 'package:shoparea_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: (87),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 15,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: (24)),
              child: TextField(
                onChanged: (value) => searchProduct(value),
                decoration: InputDecoration(
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
                  hintText: 'Mau cari apa?',
                  hintStyle: TextStyle(
                    color: cColorExpired30,
                    fontWeight: FontWeight.w400,
                    fontSize: (12),
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => ItemListProduct(
                  product: foundProducts[index],
                ),
              ),
              Visibility(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/iv_empty_state.png"),
                      Text(
                        "Hasil Tidak Ditemukan",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: (20),
                          color: cColorNeutralBlack50,
                        ),
                      ),
                      SizedBox(
                        height: (8),
                      ),
                      Text(
                        "Coba dengan keyword lain",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: (14),
                          color: cColorExpired50,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Product> foundProducts = [];

  @override
  void initState() {
    foundProducts = products;
    super.initState();
  }

  void searchProduct(String query) {
    List<Product> results = [];
    if (query.isEmpty) {
      results = products;
    } else {
      results = products
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      foundProducts = results;
    });
  }
}
