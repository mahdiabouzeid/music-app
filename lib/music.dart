import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
String _baseURL = 'mymusicapp24.atwebpages.com';

class Music{
  int id;
  String title;
  String artist;
  String album;
  String image;
  String audioUrl;
  bool favorite=false;
  Music(
   this.id,
   this.title,
   this.artist,
   this.album,
   this.image,
   this.audioUrl,
  {this.favorite = false}
  );
  

}
List<Music> songs = [

];

void getSongs(Function(bool success) update) async{
  final url = Uri.http(_baseURL , 'getSongs.php');
  final response = await http.get(url).timeout(Duration(seconds: 10));
  songs.clear();
  if(response.statusCode == 200){
    final jsonResponse = convert.jsonDecode(response.body);
    for(var row in jsonResponse){
      Music s = Music(
        row['id'],
        row['title'],
        row['artist'],
        row['album'],
        row['image'],
        row['audioUrl'],
      );
      songs.add(s);
    }
    update(true);
  }
  update(false);
}