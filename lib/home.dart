import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/playSong.dart';
import 'music.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'https://www.billboard.com/wp-content/uploads/2022/03/20.-Joy-Division-%E2%80%98Unknown-Pleasures-1979-album-art-billboard-1240.jpg?w=768',
    'https://www.billboard.com/wp-content/uploads/2022/06/beyonce-Lemonade-album-art-billboard-1240.jpg?w=768',
    'https://www.billboard.com/wp-content/uploads/media/tyler-the-creator-igor-album-art-2019-billboard-embed.jpg?w=768',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple,
          title: Text('List of Available Songs'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Image Slider
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imgList
                  .map((item) => Container(
                        child: Center(
                            child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: 1000,
                        )),
                      ))
                  .toList(),
            ),
            // List of Songs
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.music_note),
                      title: Text(songs[index].title),
                      subtitle: Text('Album: ${songs[index].album}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite),
                        color: songs[index].favorite ? Colors.purple : null,
                        onPressed: () {
                          setState(() {
                            songs[index].favorite = !songs[index].favorite;
                          });
                        },
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Playsong(
                                song: songs[index], url: songs[index].image)));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}