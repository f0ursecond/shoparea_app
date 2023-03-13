// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoparea_app/routes.dart';
import 'package:shoparea_app/screen/front_store/front_store_screen.dart';
import 'package:shoparea_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoparea',
      theme: themeData(),
      initialRoute: FrontStoreScreen.routeName,
      routes: routes,
    );
  }
}
