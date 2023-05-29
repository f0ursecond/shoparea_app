// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';

import 'Product.dart';

class Transaction {
  final List<Product> products;
  final String namaToko;
  final int totalProducts;
  final double totalHarga;
  String? statusBayar;
  final DateTime waktuPesan;
  final String jasaPengiriman;
  final int ongkosKirim;
  final int biayaAdmin;

  Transaction({
    required this.products,
    required this.namaToko,
    required this.totalProducts,
    required this.totalHarga,
    this.statusBayar,
    required this.waktuPesan,
    required this.jasaPengiriman,
    required this.ongkosKirim,
    required this.biayaAdmin,
  });

  static List<Transaction> transactions = [];

  static List<Transaction> getAllData() {
    return transactions;
  }

  void addData(Transaction transaction) {
    transactions.add(transaction);
  }

  static void editData(int idProduct, Transaction newTransaction) {
    int index = transactions.indexWhere((transaction) {
      return transaction.products.any((product) => product.id == idProduct);
    });

    if (index != -1) {
      transactions[index] = newTransaction;
    }
  }

  static void hapusData(int idProduct) {
    transactions.removeWhere((transaction) {
      return transaction.products.any((product) => product.id == idProduct);
    });
  }

  Transaction getOneDataByProductId(int productId) {
    return transactions.firstWhere((transaction) {
      return transaction.products.any((product) => product.id == productId);
    });
  }
}
