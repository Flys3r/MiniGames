import 'dart:math';

import 'package:flutter/material.dart';


class ShifumiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shifumi',
      home: ShifumiPage(),
    );
  }
}

class ShifumiPage extends StatefulWidget {
  @override
  _ShifumiPageState createState() => _ShifumiPageState();
}

class _ShifumiPageState extends State<ShifumiPage> {
  final List<String> _options = ['Pierre', 'Feuille', 'Ciseaux'];
  String _userChoice = '';
  String _computerChoice = '';
  String _result = '';

  void _play(String userChoice) {
    setState(() {
      _userChoice = userChoice;
      final random = Random();
      _computerChoice = _options[random.nextInt(_options.length)];
      _calculateResult();
    });
  }

  void _calculateResult() {
    if (_userChoice == _computerChoice) {
      _result = 'Égalité';
    } else if ((_userChoice == 'Pierre' && _computerChoice == 'Ciseaux') ||
        (_userChoice == 'Feuille' && _computerChoice == 'Pierre') ||
        (_userChoice == 'Ciseaux' && _computerChoice == 'Feuille')) {
      _result = 'Vous avez gagné !';
    } else {
      _result = 'Vous avez perdu !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shifumi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Faites votre choix :',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _options
                  .map((option) => ElevatedButton(
                onPressed: () => _play(option),
                child: Text(option),
              ))
                  .toList(),
            ),
            SizedBox(height: 40.0),
            Text(
              _userChoice.isNotEmpty ? 'Vous avez choisi $_userChoice.' : '',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              _computerChoice.isNotEmpty
                  ? 'L\'ordinateur a choisi $_computerChoice.'
                  : '',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Text(
              _result.isNotEmpty ? _result : '',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
