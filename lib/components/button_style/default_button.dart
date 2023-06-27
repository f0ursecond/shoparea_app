import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.press,
    required this.text,
  });

  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      width: kIsWeb ? 400.0 : double.infinity,
      height: kIsWeb ? 48.0 : 48.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        onPressed: press,
        child: Text(text),
      ),
    );
  }
}
