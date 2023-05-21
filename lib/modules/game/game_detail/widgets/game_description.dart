import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tabuleiro/models/game_model.dart';

class GameDescription extends StatelessWidget {
  final GameModel game;
  const GameDescription({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        "Descrição do jogo",
        style: context.textTheme.titleMedium,
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(game.description),
        ),
      ),
    ]);
  }
}
