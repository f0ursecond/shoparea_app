// ignore_for_file: prefer_const_constructors, file_names

class Product {
  final String title, category, description;
  final int price, id, stok;
  final List<String> images;
  final List<String> colors;
  final List<String> size;

  Product({
    required this.id,
    required this.images,
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.size,
    required this.colors,
    required this.stok,
  });
}

List<Product> products = [
  Product(
    id: 1,
    images: [
      "assets/images/sepatu_pelangi.png",
    ],
    title: "Sepatu Pelangi",
    category: "Sepatu",
    description:
        "Ini adalah deskripsi sepatu pelangi. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 1000000,
    size: [
      "S(20x30)",
      "M(30x40)",
      "L(40x50)",
      "XL(50x60)",
    ],
    stok: 200,
    colors: [
      "Merah",
      "Biru",
      "Hijau",
      "Kuning",
    ],
  ),
  Product(
    id: 2,
    images: [
      "assets/images/sepatu_merah.png",
    ],
    title: "Sepatu Coklat",
    category: "Sepatu",
    description:
        "Ini adalah deskripsi sepatu perah. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 2000000,
    size: [
      "S(20x30)",
      "M(30x40)",
    ],
    stok: 160,
    colors: [
      "Merah",
    ],
  ),
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
  Product(
    id: 6,
    images: [
      "assets/images/sendal_terbang.png",
    ],
    title: "Sendal Terbang",
    category: "Sendal",
    description:
        "Ini adalah deskripsi Sendal Terbang. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 2200000,
    size: [
      "S(20x30)",
      "M(30x40)",
      "L(40x50)",
      "XL(50x60)",
    ],
    stok: 44,
    colors: [
      "Hijau",
      "Kuning",
      "Biru",
      "Merah",
      "Jingga",
    ],
  ),
  Product(
    id: 7,
    images: [
      "assets/images/sendal_buaya.png",
    ],
    title: "Sendal Buaya",
    category: "Sendal",
    description:
        "Ini adalah deskripsi Sendal Buaya. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 4000000,
    size: [
      "L(40x50)",
      "XL(50x60)",
    ],
    stok: 356,
    colors: [
      "Hijau",
      "Kuning",
    ],
  ),
  Product(
    id: 8,
    images: [
      "assets/images/sendal_kayu.png",
    ],
    title: "Sendal Kayu",
    category: "Sendal",
    description:
        "Ini adalah deskripsi Sendal Kayu. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 987000,
    size: [
      "S(20x30)",
      "M(30x40)",
      "L(40x50)",
      "XL(50x60)",
    ],
    stok: 256,
    colors: [
      "Hijau",
      "Kuning",
    ],
  ),
  Product(
    id: 9,
    images: [
      "assets/images/sepatu_pelangi.png",
    ],
    title: "Sepatu Pelangi",
    category: "Sepatu",
    description:
        "Ini adalah deskripsi sepatu pelangi. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 1000000,
    size: [
      "S(20x30)",
      "M(30x40)",
      "L(40x50)",
      "XL(50x60)",
    ],
    stok: 200,
    colors: [
      "Merah",
      "Biru",
      "Hijau",
      "Kuning",
    ],
  ),
  Product(
    id: 10,
    images: [
      "assets/images/sepatu_merah.png",
    ],
    title: "Sepatu Coklat",
    category: "Sepatu",
    description:
        "Ini adalah deskripsi sepatu perah. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 2000000,
    size: [
      "S(20x30)",
      "M(30x40)",
    ],
    stok: 160,
    colors: [
      "Merah",
    ],
  ),
  Product(
    id: 11,
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
  Product(
    id: 12,
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
  Product(
    id: 13,
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
  Product(
    id: 14,
    images: [
      "assets/images/sendal_terbang.png",
    ],
    title: "Sendal Terbang",
    category: "Sendal",
    description:
        "Ini adalah deskripsi Sendal Terbang. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 2200000,
    size: [
      "S(20x30)",
      "M(30x40)",
      "L(40x50)",
      "XL(50x60)",
    ],
    stok: 44,
    colors: [
      "Hijau",
      "Kuning",
      "Biru",
      "Merah",
      "Jingga",
    ],
  ),
  Product(
    id: 15,
    images: [
      "assets/images/sendal_buaya.png",
    ],
    title: "Sendal Buaya",
    category: "Sendal",
    description:
        "Ini adalah deskripsi Sendal Buaya. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 4000000,
    size: [
      "L(40x50)",
      "XL(50x60)",
    ],
    stok: 356,
    colors: [
      "Hijau",
      "Kuning",
    ],
  ),
  // Product(
  //   id: 16,
  //   images: [
  //     "assets/images/sendal_kayu.png",
  //   ],
  //   title: "Sendal Kayu",
  // category: "Sendal",
  // description:
  //       "Ini adalah deskripsi Sendal Kayu. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  //   price: 987000,
  //   size: [
  //     "S(20x30)",
  //     "M(30x40)",
  //     "L(40x50)",
  //     "XL(50x60)",
  //   ],
  //   stok: 256,
  //   colors: [
  //     "Hijau",
  //     "Kuning",
  //   ],
  // ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
