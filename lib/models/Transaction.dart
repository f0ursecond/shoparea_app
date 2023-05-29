// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';

import 'Product.dart';

class TransactionModel {
  List<Product> transactions = [];

  List<Product> getAllData() {
    return transactions;
  }

  void addData(Product transaction) {
    transactions.add(transaction);
  }

  void editData(int idProduct, Product newTransaction) {
    int index = transactions.indexWhere((transaction) {
      return transaction.products.id == idProduct;
    });

    if (index != -1) {
      transactions[index] = newTransaction;
    }
  }

  void hapusData(int idProduct) {
    transactions.removeWhere((transaction) {
      return transaction.id == idProduct;
    });
  }

  Transaction getOneDataByProductId(int productId) {
    return transactions.firstWhere((transaction) {
      return transaction.id == productId;
    });
  }
}
