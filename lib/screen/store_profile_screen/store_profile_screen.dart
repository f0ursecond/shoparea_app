import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/screen/store_profile_screen/components/account_section.dart';
import 'package:shoparea_app/screen/store_profile_screen/components/another_info.dart';
import 'package:shoparea_app/screen/store_profile_screen/components/logout_button.dart';
import 'package:shoparea_app/size_config.dart';

import '../onboarding_screen/components/pageview_item.dart';

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
            automaticallyImplyLeading: false,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const CustomCircleAvatar(),
                  title: const Text('Warung Jos'),
                  subtitle: const Text('039103912312\nwarung@gmail.com'),
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Text('Lihat Toko'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: TitleText(
                    title: 'Akun',
                  ),
                ),
                SizedBox(
                  height: kIsWeb
                      ? MediaQuery.of(context).size.height / 4.1
                      : MediaQuery.of(context).size.height / 4.8,
                  child: const AccountSection(),
                ),
                Container(
                  height: kIsWeb
                      ? getWebProportionateScreenHeight(15)
                      : getProportionateScreenHeight(15),
                  color: Colors.grey[200],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: TitleText(
                    title: 'Info Lainya',
                  ),
                ),
                SizedBox(
                  height: kIsWeb
                      ? MediaQuery.of(context).size.height / 4.1
                      : MediaQuery.of(context).size.height / 4.2,
                  child: const AnotherInfo(),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LogOutButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}
