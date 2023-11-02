import 'package:flutter/material.dart';
import 'package:flutter_dice_game/screens/playscreen.dart';

class Result extends StatelessWidget {
  int player1Score;
  int player2Score;
  String player1Name;
  String player2Name;
  Result(
      {super.key,
      required this.player1Score,
      required this.player2Score,
      required this.player1Name,
      required this.player2Name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  player1Score >= player2Score
                      ? (player1Score == player2Score
                          ? 'Both Players have equal score'
                          : '$player1Name Wins')
                      : '$player2Name Wins',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Score of $player1Name: $player1Score',
                ),
                Text(
                  'Score of $player2Name: $player2Score',
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 35,
                          ),
                          child: Text('play again'),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PlayScreen(
                                  player1Name: player1Name,
                                  player2Name: player2Name),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
