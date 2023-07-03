import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.press,
    required this.text,
    required this.bgcolor,
    this.icon,
    required this.textcolor,
  });

  final VoidCallback press;
  final String text;
  final Color bgcolor;
  final Color textcolor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        width: kIsWeb ? 400.0 : double.infinity,
        height: kIsWeb ? 48.0 : 48.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgcolor,
          ),
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: textcolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
