import 'package:flutter/material.dart';

class TicTacTue extends StatefulWidget {
  @override
  _TicTacTueState createState() => _TicTacTueState();
}

class _TicTacTueState extends State<TicTacTue> {
  String player = 'X';
  List<String> board = List.filled(9, '');
  bool gameOver = false;
  String winner = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Tue'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Player: $player'),
            Text('Winner: $winner'),
            TextButton(
              onPressed: () {
                setState(() {
                  player = 'X';
                  board = List.filled(9, '');
                  gameOver = false;
                  winner = '';
                });
              },
              child: Text('Reset'),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {
                    if (board[index] == '' && !gameOver) {
                      setState(() {
                        board[index] = player;
                        if (checkWinner()) {
                          winner = player;
                          gameOver = true;
                        } else {
                          player = player == 'X' ? 'O' : 'X';
                        }
                      });
                    }
                  },
                  child: Text(board[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool checkWinner() {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] != '' &&
          board[i] == board[i + 1] &&
          board[i] == board[i + 2]) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] != '' &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        return true;
      }
    }

    // Check diagonals
    if (board[0] != '' && board[0] == board[4] && board[0] == board[8]) {
      return true;
    }
    if (board[2] != '' && board[2] == board[4] && board[2] == board[6]) {
      return true;
    }

    return false;
  }
}
