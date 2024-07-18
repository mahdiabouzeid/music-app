import 'package:flutter/material.dart';
import 'package:musicapp/login.dart';
class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home :SafeArea(
      child: Scaffold(
        backgroundColor:Colors.purple,
        body:  Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Container(
            child:Text('Sign Up',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),)
          ),
          SizedBox(height: 20.0,),
          Container(
            child: TextField(
              
              decoration: const InputDecoration(
                hintText: 'Enter A username',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container( child: TextField(
              decoration: const InputDecoration(
                hintText: 'Enter An Email',
                border: OutlineInputBorder(),
              ),
          ),
          ),
          SizedBox(height: 20.0,),
          Container(
            child:const TextField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'choose A Password',
                border: OutlineInputBorder(),
              ),
          ), 
          ),
          SizedBox(height: 20.0,),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
          }, child: Text('Signup'))
         ],) ,
         ),
        ),
    ),);
  }
}