import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/screen/home_screen/home_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  static String routeName = '/home_screen/';

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _selectedIndex = 0;

  static const List<Widget> body = [
    HomeScreen(),
    Text('Transaksi Screen'),
    Text('History Screen'),
    Text('Profile Screen')
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: kIsWeb ? Border.all(color: cColorPrimary50) : null),
        width: kIsWeb ? 400.0 : double.infinity,
        child: Scaffold(
          body: body.elementAt(_selectedIndex),
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            selectedLabelStyle: const TextStyle(color: Colors.green),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: Colors.green,
                ),
                icon: Icon(
                  Icons.shopping_cart_checkout_outlined,
                ),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.history,
                  color: Colors.green,
                ),
                icon: Icon(
                  Icons.history,
                ),
                label: 'Histori',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onTap,
          ),
        ),
      ),
    );
  }
}
