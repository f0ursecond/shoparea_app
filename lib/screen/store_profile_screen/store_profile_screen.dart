import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StoreProfileScreen extends StatelessWidget {
  const StoreProfileScreen({super.key});

  static String routeName = '/profile_screen/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: Colors.transparent) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Profil'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
