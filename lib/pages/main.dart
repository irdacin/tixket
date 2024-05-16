import 'package:flutter/material.dart';
import 'package:tixket/pages/home/home_page.dart';
import 'package:tixket/pages/profile/profile_page.dart';
import 'package:tixket/pages/favorite/favorite_page.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    const FavoritePage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color(0xff6e6e6e),
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Main"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite"
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe25a, fontFamily: 'MaterialIcons')),
            label: "M.Food"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          )
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}