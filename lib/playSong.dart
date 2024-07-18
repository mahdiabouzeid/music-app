import 'package:flutter/material.dart';
import 'music.dart';

class Playsong extends StatelessWidget {
 final Music song;
  final String url;
  const Playsong({required this.song, super.key,required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(song.title,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 8),
            Text('Album: ${song.album}'),
            SizedBox(height: 16),
            Image.network('https://marketplace.canva.com/EAFy2GgsPAo/2/0/1600w/canva-red-minimalist-creative-man-without-head-album-cover-_bB_o4a7jdE.jpg'),
          ]
        ),
      ),
    );
  }
}