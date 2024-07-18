import 'package:flutter/material.dart';
import 'package:musicapp/home.dart';
import 'search.dart';
import 'library.dart';
import 'profile.dart';
class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selected=0;
   final List<Widget> _pages = [
    Home(), // Replace with your actual Home widget
    Search(), // Replace with your actual Search widget
    Library(), // Replace with your actual Library widget
    Profile(), // Replace with your actual Profile widget
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
          BottomNavigationBarItem(icon:Icon(Icons.library_music_sharp) ,label: 'Library'),
          BottomNavigationBarItem(icon:Icon(Icons.person),label: 'Profile')
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        ),
        
     
    );
  }
}