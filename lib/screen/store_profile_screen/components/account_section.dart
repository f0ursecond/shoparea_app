import 'package:flutter/material.dart';

class AccountSection extends StatefulWidget {
  const AccountSection({
    super.key,
  });

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

enum SelectLanguage { english, indonesia }

class _AccountSectionState extends State<AccountSection> {
  final SelectLanguage language = SelectLanguage.indonesia;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    List<Map<String, dynamic>> accountList = [
      {
        "title": "Pesananku",
        "icon": const Icon(
          Icons.receipt,
          color: Colors.black,
        ),
        "link": '/transaksi_screen/'
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
        "link": '/ganti_bahasa',
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
            onPressed: () {
              Navigator.pushNamed(context, list['link']);
            },
            icon: const Icon(Icons.arrow_right_sharp),
          ),
        );
      },
    );
  }
}
