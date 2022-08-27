import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

// ignore: camel_case_types
class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

// ignore: camel_case_types
class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amberAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, size: 18.0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search, size: 18.0),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart, size: 18.0),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person, size: 18.0),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        iconSize: 23,
        onTap: _onItemTapped,
        elevation: 3,
      ),
    );
  }
}
