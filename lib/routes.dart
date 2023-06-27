// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:shoparea_app/screen/account_settings_screen/account_settings_screen.dart';
import 'package:shoparea_app/screen/details_screen/detail_screen.dart';
import 'package:shoparea_app/screen/front_store/front_store_screen.dart';
import 'package:shoparea_app/screen/informasi_toko/informasi_toko_screen.dart';
import 'package:shoparea_app/screen/keranjang_screen/keranjang_screen.dart';
import 'package:shoparea_app/screen/onboarding_screen/onboarding_screen.dart';
import 'package:shoparea_app/screen/pengiriman_screen/pengiriman_screen.dart';
import 'package:shoparea_app/screen/search_screen/search_screen.dart';
import 'package:shoparea_app/screen/semua_pesanan_screen/semua_pesanan_screen.dart';
import 'package:shoparea_app/screen/splash_screen/splash_screen.dart';
import 'package:shoparea_app/screen/status_bayar_screen/status_bayar_screen.dart';
import 'package:shoparea_app/screen/tracking_pesanan/tracking_pesanan_screen.dart';
import 'package:shoparea_app/screen/welcome_screen/welcome_screen.dart';

// we use name route, all our routes will be available here
final Map<String, WidgetBuilder> routes = {
  // INI ADALAH ROUTES UNTUK ADMIN

  SplashScreen.routeName: (context) => SplashScreen(),
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  AccountSettingsScreen.routeName: (context) => AccountSettingsScreen(),

  // INI ADALAH ROUTES UNTUK USER

  FrontStoreScreen.routeName: (context) => FrontStoreScreen(),
  DetailScreen.routeName: (context) => DetailScreen(),
  InformasiTokoScreen.routeName: (context) => InformasiTokoScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  KeranjangScreen.routeName: (context) => KeranjangScreen(),
  PengirimanScreen.routeName: (context) => PengirimanScreen(),
  StatusBayarScreen.routeName: (context) => StatusBayarScreen(),
  SemuaPesananScreen.routeName: (context) => SemuaPesananScreen(),
  TrackingPesananScreen.routeName: (context) => TrackingPesananScreen(),
};
