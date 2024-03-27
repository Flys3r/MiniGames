import 'package:flutter/material.dart';
import '/screens/shifumi.dart';
import '/screens/morpion.dart';
import '/screens/profil.dart';
import '/screens/connexion.dart';

class HomeScreen extends StatelessWidget {
  final String userEmail;
  final String firstName;
  final String lastName;

  HomeScreen({required this.userEmail, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeux'),
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilPage(userEmail: userEmail)),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConnexionScreen()), // Redirigez vers la page de connexion
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildCard(
            context,
            'Shifumi',
            'assets/shifumi.jpg',
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShifumiPage()),
              );
            },
          ),
          _buildCard(
            context,
            'Morpion',
            'assets/morpion.jpg',
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MorpionPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String imagePath, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Column(
          children: <Widget>[
            Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onTap,
              child: Text('Jouer'),
            ),
          ],
        ),
      ),
    );
  }
}






