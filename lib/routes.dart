// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:shoparea_app/screen/front_store/front_store_screen.dart';
import 'package:shoparea_app/screen/informasi_toko/informasi_toko_screen.dart';
import 'package:shoparea_app/screen/keranjang_screen/keranjang_screen.dart';
import 'package:shoparea_app/screen/search_screen/search_screen.dart';

// we use name route, all our routes will be available here
final Map<String, WidgetBuilder> routes = {
  FrontStoreScreen.routeName: (context) => FrontStoreScreen(),
  InformasiTokoScreen.routeName: (context) => InformasiTokoScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  KeranjangScreen.routeName: (context) => KeranjangScreen(),
};
