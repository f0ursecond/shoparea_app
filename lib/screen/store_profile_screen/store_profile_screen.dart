import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/size_config.dart';

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
          // ignore: use_full_hex_values_for_flutter_colors
          backgroundColor: const Color(0xFFFFAFAFA),
          appBar: AppBar(
            elevation: 0,
            title: const Text('Profil'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 80,
              ),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(165)
                        : getProportionateScreenHeight(165),
                    child: const ProfileSection(),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(8)
                        : getProportionateScreenHeight(8),
                  ),
                  Container(
                    color: Colors.white,
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(280)
                        : getProportionateScreenHeight(280),
                    child: const Padding(
                      padding: EdgeInsets.all(24),
                      child: AccountSection(),
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(8)
                        : getProportionateScreenHeight(8),
                  ),
                  Container(
                    color: Colors.white,
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(320)
                        : getProportionateScreenHeight(300),
                    child: const Padding(
                      padding: EdgeInsets.all(24),
                      child: AnotherInfo(),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: kIsWeb
                        ? getWebProportionateScreenHeight(68)
                        : getProportionateScreenHeight(68),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 15),
                      child: LogOutButton(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CircleAvatar(
            maxRadius: 26,
          ),
        ),
        const Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Warung Joss',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              Text('+621928192819'),
              Text('warungjos@gmail.com')
            ],
          ),
        ),
        Expanded(
          flex: -1,
          child: TextButton(
            onPressed: () {},
            child: const Text('Lihat toko'),
          ),
        ),
      ],
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: const Center(
        child: Text(
          'Keluar',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Info Lainya',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: ListView.builder(
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
              }),
        ),
      ],
    );
  }
}

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
      },
      {
        "title": "Alamat Tersimpan",
        "icon": const Icon(
          Icons.home_outlined,
          color: Colors.black,
        ),
      },
      {
        "title": "Pilihan Bahasa",
        "icon": const Icon(
          Icons.translate,
          color: Colors.black,
        ),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Akun',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: accountList.length,
            itemBuilder: (context, index) {
              var list = accountList[index];
              return ListTile(
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
          ),
        ),
      ],
    );
  }
}
