// ignore_for_file: prefer_const_constructors, file_names

class Product {
  final String title, description;
  final int price, id;
  final List<String> images;
  final List<String> colors;
  final List<String> size;

  Product({
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    required this.colors,
  });
}

List<Product> products = [
  Product(
    id: 1,
    images: [
      "assets/images/sepatu_pelangi.png",
    ],
    title: "Sepatu Pelangi",
    description:
        "Ini adalah deskripsi sepatu pelangi. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 1000000,
    size: [
      "S(20x30)",
      "M(30x40)",
      "L(40x50)",
      "XL(50x60)",
    ],
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
    description:
        "Ini adalah deskripsi sepatu perah. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 2000000,
    size: [
      "S(20x30)",
      "M(30x40)",
    ],
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
    description:
        "Ini adalah deskripsi sepatu coklat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 600000,
    size: [
      "S(20x30)",
      "M(30x40)",
      "L(40x50)",
    ],
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
    description:
        "Ini adalah deskripsi sepatu bola. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price: 7000000,
    size: [
      "S(20x30)",
      "M(30x40)",
      "L(40x50)",
      "XL(50x60)",
    ],
    colors: [
      "Hijau",
      "Kuning",
    ],
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
