import 'package:flutter/material.dart';
import 'package:tabuleiro/models/game_model.dart';

class GameExpansion extends StatelessWidget {
  final GameModel game;
  const GameExpansion({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.info_outline),
        const SizedBox(width: 4),
        Expanded(
          child: Visibility(
            visible: game.expansion,
            replacement: const Text("Este não é um jogo do tipo expansão"),
            child: const Text(
              "Este é um jogo do tipo expansão",
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
