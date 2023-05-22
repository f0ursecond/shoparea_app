// ignore_for_file: file_names

import 'package:shoparea_app/models/Product.dart';

List<Product> cartItems = [];

class CartModel {
  bool addToCart(Product product) {
    // Periksa apakah produk sudah ada di dalam keranjang
    bool isProductInCart = cartItems.contains(product);

    // Jika produk belum ada di dalam keranjang, tambahkan ke dalam keranjang
    if (!isProductInCart) {
      cartItems.add(product);
      return true;
    }

    return false;
  }

  List<Product> getCartItems() {
    return cartItems;
  }

  bool removeFromCart(Product product) {
    // Periksa apakah produk ada di dalam keranjang
    bool isProductInCart = cartItems.contains(product);

    // Jika produk ada di dalam keranjang, hapus dari keranjang
    if (isProductInCart) {
      cartItems.remove(product);
      return true;
    }

    return false;
  }
}
