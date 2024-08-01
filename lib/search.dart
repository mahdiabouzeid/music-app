import 'package:flutter/material.dart';
import 'music.dart';
import 'playSong.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  List<Music> _filteredSongs = [];

  @override
  void initState() {
    super.initState();
    // Initialize with all songs or fetched songs
    getSongs((success) {
      if (success) {
        setState(() {
          _filteredSongs = songs;
        });
      }
    });
    // Add listener to the search controller
    _searchController.addListener(_filterSongs);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterSongs() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredSongs = songs.where((song) {
        return song.title.toLowerCase().contains(query) ||
            song.artist.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Songs'),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredSongs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.music_note),
                      title: Text(_filteredSongs[index].title),
                      subtitle: Text('Album: ${_filteredSongs[index].album}'),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite),
                        color: _filteredSongs[index].favorite ? Colors.purple : null,
                        onPressed: () {
                          setState(() {
                            _filteredSongs[index].favorite = !_filteredSongs[index].favorite;
                          });
                        },
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Playsong(
                            song: _filteredSongs[index],
                            url: _filteredSongs[index].image,
                          ),
                        ));
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
