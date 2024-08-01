import 'package:flutter/material.dart';
import 'package:musicapp/home.dart';
import 'search.dart';
import 'favorite.dart';
import 'profile.dart';
class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selected=0;
   final List<Widget> _pages = [
    Home(),
    Search(),
    Library(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        onTap: (i){
          setState(() {
             _selected=i;
          });
        },

        items: [
     BottomNavigationBarItem(icon:Icon(Icons.home) ,label: 'Home'),
         BottomNavigationBarItem(icon:Icon(Icons.search) ,label: 'Search'),
          BottomNavigationBarItem(icon:Icon(Icons.favorite) ,label: 'Favorites'),
          BottomNavigationBarItem(icon:Icon(Icons.person),label: 'Profile')
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        ),
    );
  }
}