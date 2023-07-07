import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 60,
      ),
      child: SizedBox(
        height: 50,
        // decoration: BoxDecoration(
        //     border: Border.all(
        //       color: Colors.red,
        //     ),
        //     borderRadius: BorderRadius.circular(8)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.red,
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.red),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Keluar',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
