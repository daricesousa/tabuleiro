import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabuleiro/core/ui/widgets/app_image_net.dart';
import 'package:tabuleiro/models/game_model.dart';

class GameInfo extends StatelessWidget {
  final GameModel game;

  const GameInfo({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            constraints: const BoxConstraints(
              maxWidth: 300,
              maxHeight: 300,
            ),
            child: AppImageNet(
              imageUrl: game.banner,
              height: context.widthTransformer(reducedBy: 70),
              width: context.widthTransformer(reducedBy: 70),
            )),
        if (context.width >= 800) const SizedBox(width: 85),
        if (context.width < 800) const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.name,
                style: context.textTheme.headlineSmall,
                softWrap: true,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(width: 4),
                  Text(game.year),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.people),
                  const SizedBox(width: 4),
                  Text(
                    "${game.minPlayers} a ${game.maxPlayers} jogadores",
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.hourglass_bottom),
                  const SizedBox(width: 4),
                  Text(
                    "${game.averageDurationMinutes} minutos",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
