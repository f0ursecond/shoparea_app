import 'package:flutter/material.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> accountList = [
      {
        "title": "Pesananku",
        "icon": const Icon(
          Icons.receipt,
          color: Colors.black,
        ),
        "link": '/'
      },
      {
        "title": "Alamat Tersimpan",
        "icon": const Icon(
          Icons.home_outlined,
          color: Colors.black,
        ),
        "link": '/alamat_tersimpan/'
      },
      {
        "title": "Pilihan Bahasa",
        "icon": const Icon(
          Icons.translate,
          color: Colors.black,
        ),
        "link": '/'
      },
    ];

    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
          color: Colors.black,
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: accountList.length,
      itemBuilder: (context, index) {
        var list = accountList[index];
        return ListTile(
          dense: true,
          leading: list['icon'],
          title: Text(
            list['title'],
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
      },
    );
  }
}
