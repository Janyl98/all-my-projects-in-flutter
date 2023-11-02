import 'package:flutter/material.dart';
import 'package:flutter_dice_game/screens/playscreen.dart';

class Infoscreen extends StatelessWidget {
  Infoscreen({super.key});
  final firstPlayerName = TextEditingController();
  final secondPlayerName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Player 1',
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: firstPlayerName,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      RegExp reg = RegExp(r'^{6,}$');
                      if (value!.isEmpty) {
                        return ('Pleas Enter Name of First Player');
                      }
                      if (!reg.hasMatch(value)) {
                        return ('Pleas Enter Valid Name (Min. 3 character)');
                      }
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      prefix: const Icon(
                        Icons.person,
                      ),
                      hintText: 'Enter Player 1 Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Player 2',
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: secondPlayerName,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      RegExp reg = RegExp(r'^{6,}$');
                      if (value!.isEmpty) {
                        return ('Pleas Enter Name of Second Player');
                      }
                      if (!reg.hasMatch(value)) {
                        return ('Pleas Enter Valid Name (Min. 3 character)');
                      }
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      prefix: const Icon(
                        Icons.person,
                      ),
                      hintText: 'Enter Player 2 Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 10,
                    ),
                    child: Text(
                      'start',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PlayScreen(
                          player1Name: firstPlayerName.text,
                          player2Name: secondPlayerName.text,
                        ),
                      ),
                    );
                  },
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
