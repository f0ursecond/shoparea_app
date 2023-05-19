import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/details_screen/components/body.dart';

class ImageProduct extends StatelessWidget {
  const ImageProduct({
    super.key,
    required this.widget,
  });

  final Body widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        widget.product!.images[0],
        width: (327),
        height: (285),
        fit: BoxFit.fill,
      ),
    );
  }
}
