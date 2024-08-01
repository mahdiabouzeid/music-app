import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'music.dart';

class Playsong extends StatefulWidget {
  final Music song;
  final String url;

  const Playsong({super.key, required this.song, required this.url});

  @override
  State<Playsong> createState() => _PlaysongState();
}

class _PlaysongState extends State<Playsong> {

  late YoutubePlayerController _controller;
  bool _isVideoValid = false;

  @override
  void initState() {
    super.initState();
    String videoId = YoutubePlayer.convertUrlToId(widget.url) ?? '';
    print('YouTube URL: ${widget.url}');
    print('Extracted Video ID: $videoId');

    if (videoId.isNotEmpty) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
      _isVideoValid = true;
    } else {

      _isVideoValid = false;
      // Optionally, show a placeholder or an error message
      print('Invalid video ID. Make sure the URL is correct.');
    }
  }

  @override
  void dispose() {
    if (_isVideoValid) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(widget.song.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
                Image.network(widget.song.image),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black, // Optional: Background color for player
              child: _isVideoValid
                  ? YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                bottomActions: [
                  CurrentPosition(),
                  SizedBox(width: 10),
                  ProgressBar(isExpanded: true),
                  SizedBox(width: 10),
                  PlaybackSpeedButton(),
                ],
              )
                  : Center(
                child: Text(
                  'Failed to load video. Please check the URL.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
