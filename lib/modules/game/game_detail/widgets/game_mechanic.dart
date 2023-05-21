import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabuleiro/models/game_model.dart';

class GameMechanic extends StatelessWidget {
  final GameModel game;
  const GameMechanic({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Mecânicas",
          style: context.textTheme.titleMedium,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              game.mechanics?.map((e) => e?.description).join(', ') ?? '',
            ),
          ),
        ),
      ],
    );
  }
}
