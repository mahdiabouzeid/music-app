import 'package:flutter/material.dart';
import 'profile_class.dart';
import 'favorite.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        title: Text('Profile'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                profile1.username,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold ,color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                profile1.email,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Your Songs',style: TextStyle(color: Colors.white),),

            ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.favorite) , onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Library() ));
              },),
              title: Text('Favorites',style: TextStyle(color: Colors.white)),

            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Row(
                children: [
                  Text(
                    'Current Plan:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    profile1.payedplan ? 'Paid Plan' : 'Free Plan',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }
}