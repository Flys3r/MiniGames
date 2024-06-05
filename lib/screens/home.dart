import 'package:flutter/material.dart';
import '/screens/shifumi.dart';
import '/screens/morpion.dart';
import '/screens/profil.dart';
import '/screens/connexion.dart';
import '/screens/chess.dart';
import '/screens/solitaire.dart';
import '/screens/blackjack.dart';
import '/screens/sudoku.dart';

class HomeScreen extends StatelessWidget {
  final String userEmail;
  final String firstName;
  final String lastName;

  HomeScreen({required this.userEmail, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jeux',
          style: TextStyle(color: Colors.white), // Texte en blanc
        ),
        centerTitle: true, // Centrer le titre
        backgroundColor: Colors.blueAccent, // Fond de la barre de navigation en bleu
        elevation: 0, // Supprimer l'ombre sous la barre de navigation
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
                MaterialPageRoute(builder: (context) => ConnexionScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          padding: EdgeInsets.all(16.0),
          crossAxisCount: 2,
          mainAxisSpacing: 90.0,
          crossAxisSpacing: 20.0,
          children: [
            _buildGameCard(
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
            _buildGameCard(
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
            _buildGameCard(
              context,
              'Échecs',
              'assets/chess.jpg',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChessPage()),
                );
              },
            ),
            _buildGameCard(
              context,
              'Solitaire',
              'assets/solitaire.jpg',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SolitairePage()),
                );
              },
            ),
            _buildGameCard(
              context,
              'Blackjack',
              'assets/blackjack.jpg',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlackjackPage()),
                );
              },
            ),
            _buildGameCard(
              context,
              'Sudoku',
              'assets/sudoku.jpg',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SudokuPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, String title, String imagePath, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
