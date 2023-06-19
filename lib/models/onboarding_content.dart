class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingContent> content = [
  OnboardingContent(
    image: 'assets/images/vector_1.png',
    title: 'Buat Toko Online Kamu Sendiri dengan Mudah',
    description:
        'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for ',
  ),
  OnboardingContent(
    image: 'assets/images/vector_2.png',
    title: 'Kendalikan Bisnis dan Pelanggan Kamu',
    description:
        'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for ',
  ),
  OnboardingContent(
    image: 'assets/images/vector_3.png',
    title: 'Bisnis Semakin Laris , Kamu Tersenyum Manis',
    description:
        'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for ',
  ),
];
