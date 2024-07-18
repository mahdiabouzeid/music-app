import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'music.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context,index){
            return Card(
               child: ListTile(
                leading: Icon(Icons.music_note),
                title: Text(songs[index].title),
                subtitle: Text('Album: Random Access Memories'),
                onTap: (){
                  
                },
            ),
            
            );
          }),)
      
    );
  }
}