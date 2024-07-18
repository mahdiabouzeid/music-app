import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Column(
      children: [
      const  SizedBox(height: 5.0),
        TextField(
        decoration: InputDecoration(
            labelText: 'Search',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
        ),
        ),
      ],),
      ),
    );

    
  }
}