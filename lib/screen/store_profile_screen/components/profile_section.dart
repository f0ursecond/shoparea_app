import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        leading: const CircleAvatar(),
        title: const Text(
          'Warung Jos',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('01310323'),
            Text('Warungjos@gmail.com'),
          ],
        ),
        trailing: TextButton(
          onPressed: () {},
          child: const Text('Lihat Toko'),
        ),
      ),
    );
  }
}
