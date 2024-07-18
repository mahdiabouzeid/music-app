import 'package:flutter/material.dart';
import 'music.dart';
class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: Text('Your favorite Songs',
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body:   ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context,index){
          return songs[index].favorite ?
          Card( 
            child :ListTile(
              leading: Icon(Icons.music_note),
              title: Text(songs[index].title),
              subtitle: Text('Album: ${songs[index].album}'),
              trailing: IconButton(
                icon: Icon(Icons.favorite),
                color: songs[index].favorite ? Colors.purple : null,
                onPressed: () {
                  setState(() {
                    songs[index].favorite = !songs[index].favorite;
                  });
                },
              ),
          ),
            ):Text('');

          }
      
        
      ),
        
      
    );
    
  }
}