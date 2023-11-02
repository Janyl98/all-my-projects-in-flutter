import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dice_game/screens/result.dart';

class PlayScreen extends StatefulWidget {
  String player1Name;
  String player2Name;
  PlayScreen({super.key, required this.player1Name, required this.player2Name});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  String playerOneName = '';
  String playerTwoName = '';
  int player1Dice = 1;
  int player2Dice = 1;
  int player1Score = 0;
  int player2Score = 0;
  int count = 0;
  @override
  void initState() {
    super.initState();
    playerOneName = widget.player1Name == '' ? 'Player1' : widget.player1Name;
    playerTwoName = widget.player2Name == '' ? 'Player2' : widget.player2Name;
  }

  void diceChange() {
    player1Dice = Random().nextInt(6) + 1;
    player2Dice = Random().nextInt(6) + 1;
    player1Score = player1Score + player1Dice;
    player2Score = player2Score + player2Dice;
    count = count + 1;
    if (count == 11) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => Result(
                player1Score: player1Score,
                player2Score: player2Score,
                player1Name: playerOneName,
                player2Name: playerTwoName)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No of Rounds: $count/10'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(playerOneName),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          diceChange();
                        });
                      },
                      child: Image.asset('assets/dice$player1Dice.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Score: $player1Score',
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              )),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(playerTwoName),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            diceChange();
                          });
                        },
                        child: Image.asset('assets/dice$player2Dice.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Score: $player2Score',
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
