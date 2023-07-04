// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';

import 'package:shoparea_app/screen/account_settings_screen/account_settings_screen.dart';
import 'package:shoparea_app/screen/add_account_bank/add_account_bank.dart';
import 'package:shoparea_app/screen/add_product_screen/addproduct_screen.dart';
import 'package:shoparea_app/screen/alamat_pengiriman_screen/alamat_pengiriman_screen.dart';
import 'package:shoparea_app/screen/details_screen/detail_screen.dart';
import 'package:shoparea_app/screen/front_store/front_store_screen.dart';
import 'package:shoparea_app/screen/history_screen/history_screen.dart';
import 'package:shoparea_app/screen/home_screen/components/home_body.dart';
import 'package:shoparea_app/screen/home_screen/home_screen.dart';
import 'package:shoparea_app/screen/informasi_toko/informasi_toko_screen.dart';
import 'package:shoparea_app/screen/katalog_screen/katalog_screen.dart';
import 'package:shoparea_app/screen/keranjang_screen/keranjang_screen.dart';
import 'package:shoparea_app/screen/onboarding_screen/onboarding_screen.dart';
import 'package:shoparea_app/screen/pengaturan_pengiriman_screen/pengaturan_pengriman_screen.dart';
import 'package:shoparea_app/screen/pengiriman_screen/pengiriman_screen.dart';
import 'package:shoparea_app/screen/search_screen/search_screen.dart';
import 'package:shoparea_app/screen/semua_pesanan_screen/semua_pesanan_screen.dart';
import 'package:shoparea_app/screen/settings_pin_screen/settings_pin_screen.dart';
import 'package:shoparea_app/screen/splash_screen/splash_screen.dart';
import 'package:shoparea_app/screen/status_bayar_screen/status_bayar_screen.dart';
import 'package:shoparea_app/screen/store_profile_screen/store_profile_screen.dart';
import 'package:shoparea_app/screen/tracking_pesanan/tracking_pesanan_screen.dart';
import 'package:shoparea_app/screen/transaksi_screen/transaksi_screen.dart';
import 'package:shoparea_app/screen/welcome_screen/welcome_screen.dart';

// we use name route, all our routes will be available here
final Map<String, WidgetBuilder> routes = {
  // INI ADALAH ROUTES UNTUK ADMIN

  SplashScreen.routeName: (context) => SplashScreen(),
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  AccountSettingsScreen.routeName: (context) => AccountSettingsScreen(),
  HomeBody.routeName: (context) => HomeBody(),
  HomeScreen.routesName: (context) => HomeScreen(),
  TransaksiScreen.routeName: (context) => TransaksiScreen(),
  KatalogScreen.routeName: (context) => KatalogScreen(),
  HistoryScreen.routeName: (content) => HistoryScreen(),
  StoreProfileScreen.routeName: (context) => StoreProfileScreen(),
  AddProductScreen.routeName: (context) => AddProductScreen(),
  PengaturanPengirimanScreen.routeName: (context) =>
      PengaturanPengirimanScreen(),
  AlamatPengirimanScreen.routeName: (context) => AlamatPengirimanScreen(),
  AddAccountBankScreen.routeName: (context) => AddAccountBankScreen(),
  PinSettingsScreen.routeName: (context) => PinSettingsScreen(),
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
