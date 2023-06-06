import 'package:flutter/material.dart';
import 'package:tictactue/tictactueWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Tue',
      home: TicTacTue(),
    );
  }
}
