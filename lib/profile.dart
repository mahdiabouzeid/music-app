import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  
    Scaffold(
      body:Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
    ),
    );
  }
}