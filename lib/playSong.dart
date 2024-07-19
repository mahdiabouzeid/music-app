import 'package:flutter/material.dart';
import 'music.dart';

class Playsong extends StatefulWidget {
  final Music song;
  final String url;
  
  const Playsong({super.key, required this.song, required this.url});

  @override
  State<Playsong> createState() => _PlaysongState();
}

class _PlaysongState extends State<Playsong> {
  bool isPlaying = false;

  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.song.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.song.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Album: ${widget.song.album}',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Image.network(widget.url),
            SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black
                ),
                
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.stop : Icons.play_arrow,
                    color: Colors.white,
                    size: 64,
                  ),
                  onPressed: togglePlay,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
