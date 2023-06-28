// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoparea_app/routes.dart';
import 'package:shoparea_app/screen/home_screen/components/home_body.dart';
import 'package:shoparea_app/screen/home_screen/home_screen.dart';
import 'package:shoparea_app/screen/splash_screen/splash_screen.dart';
import 'package:shoparea_app/screen/transaksi_screen/transaksi_screen.dart';

import 'package:shoparea_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoparea',
      theme: themeData(),
      initialRoute: HomeBody.routeName,
      routes: routes,
    );
  }
}
