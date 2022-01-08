// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:shoeapp/ui/home/homepage.dart';

import 'package:shoeapp/ui/home/listorder.dart';
import 'package:shoeapp/ui/home/pemesanan.dart';
import 'package:shoeapp/ui/home/profile.dart';

class NavbarPage extends StatefulWidget {
  final int? initTab;
  NavbarPage({this.initTab});

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _selectedNavBar = 0;

  // ignore: unused_element
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavBar = index;
    });
  }

  final _widgetOptions = [
    HomePage(),
    ListOrderPage(),
    PemesananPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    _selectedNavBar = widget.initTab ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: "Poppins"),
      child: Scaffold(
        body: _widgetOptions[_selectedNavBar],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _changeSelectedNavBar,
          currentIndex: _selectedNavBar,
          // elevation: 0,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "List"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: "Keranjang",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          selectedItemColor: Color(0xffE96E6E),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
