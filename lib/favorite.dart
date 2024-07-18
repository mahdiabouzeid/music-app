import 'package:flutter/material.dart';
class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: Scaffold(body: Text('Library',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),), 
    
    );
  }
}