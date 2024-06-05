import 'package:flutter/material.dart';

class ChessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Échecs'),
      ),
      body: Center(
        child: Text('Bienvenue à la page des échecs'),
      ),
    );
  }
}
