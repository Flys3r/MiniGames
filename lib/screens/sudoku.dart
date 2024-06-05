import 'package:flutter/material.dart';

class SudokuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudoku'),
      ),
      body: Center(
        child: Text('Bienvenue à la page du sudoku'),
      ),
    );
  }
}
