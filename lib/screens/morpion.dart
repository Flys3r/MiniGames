import 'package:flutter/material.dart';
import 'dart:math';

class MorpionPage extends StatefulWidget {
  @override
  _MorpionPageState createState() => _MorpionPageState();
}

class _MorpionPageState extends State<MorpionPage> {
  late List<List<String>> board;
  late bool isPlayerTurn;
  late bool isGameStarted;

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    board = List.generate(3, (index) => List.generate(3, (index) => ""));
    isPlayerTurn = false;
    isGameStarted = false;
  }

  void startGame(bool playerStarts) {
    setState(() {
      isGameStarted = true;
      isPlayerTurn = playerStarts;
      if (!isPlayerTurn) {
        botMove();
      }
    });
  }

  void makeMove(int row, int col) {
    if (!isGameStarted || board[row][col] != "") {
      return;
    }

    setState(() {
      board[row][col] = isPlayerTurn ? "X" : "O";
      checkWinner();
      isPlayerTurn = !isPlayerTurn;

      if (!isPlayerTurn) {
        botMove();
      }
    });
  }

  void botMove() {
    List<int> emptyCells = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == "") {
          emptyCells.add(i * 3 + j);
        }
      }
    }

    if (emptyCells.isNotEmpty) {
      int randomCell = emptyCells[Random().nextInt(emptyCells.length)];
      int row = randomCell ~/ 3;
      int col = randomCell % 3;
      makeMove(row, col);
    }
  }

  void checkWinner() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] != "" &&
          board[i][0] == board[i][1] &&
          board[i][1] == board[i][2]) {
        showWinnerDialog(board[i][0]);
        return;
      }

      if (board[0][i] != "" &&
          board[0][i] == board[1][i] &&
          board[1][i] == board[2][i]) {
        showWinnerDialog(board[0][i]);
        return;
      }
    }

    if (board[0][0] != "" &&
        board[0][0] == board[1][1] &&
        board[1][1] == board[2][2]) {
      showWinnerDialog(board[0][0]);
      return;
    }

    if (board[0][2] != "" &&
        board[0][2] == board[1][1] &&
        board[1][1] == board[2][0]) {
      showWinnerDialog(board[0][2]);
      return;
    }

    if (!board.any((row) => row.any((cell) => cell == ""))) {
      showWinnerDialog(null);
    }
  }

  void showWinnerDialog(String? winner) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text(winner == null ? "Match nul" : "$winner a gagné !"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  initializeGame();
                },
                child: Text("Rejouer"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Morpion"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 200.0,
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isGameStarted)
                  ElevatedButton(
                    onPressed: () => startGame(true),
                    child: Text("Commencer"),
                  ),
                if (isGameStarted)
                  Text(
                    isPlayerTurn
                        ? "C'est à vous de jouer"
                        : "C'est au tour du bot",
                    style: TextStyle(
                        fontSize: 14.0), // Ajustez la taille de la police
                  ),
                SizedBox(height: 10.0),
                // Ajustez l'espacement entre les éléments
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    int row = index ~/ 3;
                    int col = index % 3;
                    return GestureDetector(
                      onTap: () => makeMove(row, col),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Text(
                            board[row][col],
                            style: TextStyle(
                                fontSize: 18.0), // Ajustez la taille de la police
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}