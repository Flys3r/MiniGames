import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../database/database.dart';

class ProfilPage extends StatefulWidget {
  final String userEmail;

  ProfilPage({required this.userEmail});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  late String firstName;
  late String lastName;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    // Utilisez la méthode getUserDetails de la classe DatabaseHelper pour obtenir les détails de l'utilisateur
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    Database db = await databaseHelper.database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      columns: ['first_name', 'last_name'],
      where: 'email = ?',
      whereArgs: [widget.userEmail],
    );
    if (result.isNotEmpty) {
      setState(() {
        firstName = result[0]['first_name'];
        lastName = result[0]['last_name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nom: $firstName $lastName',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ${widget.userEmail}',
              style: TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
