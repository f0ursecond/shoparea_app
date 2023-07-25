import 'package:flutter/material.dart';

class AnotherInfo extends StatelessWidget {
  const AnotherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> anotherInfoList = [
      {
        "title": "Kebijakan Privasi",
        "icon": const Icon(
          Icons.shield_moon_outlined,
          color: Colors.black,
        ),
      },
      {
        "title": "Ketentuan Layanan",
        "icon": const Icon(
          Icons.info_outline,
          color: Colors.black,
        ),
      },
      {
        "title": "Versi Aplikasi",
        "icon": const Icon(
          Icons.star_border,
          color: Colors.black,
        ),
      },
    ];
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: anotherInfoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: anotherInfoList[index]['icon'],
            title: Text(
              anotherInfoList[index]['title'],
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_sharp),
            ),
          );
        });
  }
}
