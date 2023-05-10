// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';

import 'Product.dart';

class Transaction {
  final List<Product> products;
  final String namaToko;
  final int totalProducts;
  final double totalHarga;
  final String statusBayar;
  final DateTime waktuPesan;
  final String jasaPengiriman;

  Transaction({
    required this.products,
    required this.namaToko,
    required this.totalProducts,
    required this.totalHarga,
    required this.statusBayar,
    required this.waktuPesan,
    required this.jasaPengiriman,
  });
}

List<Transaction> transactions = [
  Transaction(
    products: [
      Product(
        id: 3,
        images: [
          "assets/images/sepatu_coklat.png",
        ],
        title: "Sepatu Coklat",
        category: "Sepatu",
        description:
            "Ini adalah deskripsi sepatu coklat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        price: 600000,
        size: [
          "S(20x30)",
          "M(30x40)",
          "L(40x50)",
        ],
        stok: 22,
        colors: [
          "Merah",
          "Biru",
          "Hijau",
          "Kuning",
        ],
      ),
    ],
    namaToko: "Nama Toko 1",
    totalProducts: 2,
    totalHarga: 700000,
    statusBayar: 'Belum Bayar',
    waktuPesan: DateTime.now(),
    jasaPengiriman: 'JNE',
  ),
  Transaction(
    products: [
      Product(
        id: 4,
        images: [
          "assets/images/sepatu_bola.png",
        ],
        title: "Sepatu Bola",
        category: "Sepatu",
        description:
            "Ini adalah deskripsi sepatu bola. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        price: 7000000,
        size: [
          "S(20x30)",
          "M(30x40)",
          "L(40x50)",
          "XL(50x60)",
        ],
        stok: 33,
        colors: [
          "Hijau",
          "Kuning",
        ],
      ),
    ],
    namaToko: "Nama Toko 2",
    totalProducts: 2,
    totalHarga: 700000,
    statusBayar: 'Belum Bayar',
    waktuPesan: DateTime.now(),
    jasaPengiriman: 'JNE',
  ),
  Transaction(
    products: [
      Product(
        id: 4,
        images: [
          "assets/images/sepatu_bola.png",
        ],
        title: "Sepatu Bola",
        category: "Sepatu",
        description:
            "Ini adalah deskripsi sepatu bola. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        price: 7000000,
        size: [
          "S(20x30)",
          "M(30x40)",
          "L(40x50)",
          "XL(50x60)",
        ],
        stok: 33,
        colors: [
          "Hijau",
          "Kuning",
        ],
      ),
    ],
    namaToko: "Nama Toko 3",
    totalProducts: 2,
    totalHarga: 700000,
    statusBayar: 'Belum Bayar',
    waktuPesan: DateTime.now(),
    jasaPengiriman: 'JNE',
  ),
  Transaction(
    products: [
      Product(
        id: 5,
        images: [
          "assets/images/sendal_ayam.png",
        ],
        title: "Sendal Ayam",
        category: "Sendal",
        description:
            "Ini adalah deskripsi sendal ayam. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        price: 250000,
        size: [
          "S(20x30)",
          "M(30x40)",
          "L(40x50)",
          "XL(50x60)",
        ],
        stok: 33,
        colors: [
          "Hijau",
          "Kuning",
        ],
      ),
    ],
    namaToko: "Nama Toko 4",
    totalProducts: 2,
    totalHarga: 650000,
    statusBayar: 'Sudah Bayar',
    waktuPesan: DateTime.now(),
    jasaPengiriman: 'J&T',
  ),
];
