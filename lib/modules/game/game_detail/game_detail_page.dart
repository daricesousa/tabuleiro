import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tabuleiro/core/ui/widgets/dialog_logout.dart';
import 'package:tabuleiro/modules/game/game_detail/widgets/game_description.dart';
import 'package:tabuleiro/modules/game/game_detail/widgets/game_expansion.dart';
import 'package:tabuleiro/modules/game/game_detail/widgets/game_info.dart';
import 'package:tabuleiro/modules/game/game_detail/widgets/game_mechanic.dart';
import './game_detail_controller.dart';

class GameDetailPage extends GetView<GameDetailController> {
  const GameDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(controller.game?.name ?? ''),
          actions: [
            IconButton(
              onPressed: () {
                Get.dialog(DialogLogout(
                  onConfirm: controller.logout,
                ));
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Column(
          children: [
            if (controller.loading.value) const LinearProgressIndicator(),
            if (controller.game != null)
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Align(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 800,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GameInfo(game: controller.game!),
                            const SizedBox(height: 12),
                            GameDescription(game: controller.game!),
                            const SizedBox(height: 12),
                            GameMechanic(game: controller.game!),
                            const SizedBox(height: 12),
                            GameExpansion(game: controller.game!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
