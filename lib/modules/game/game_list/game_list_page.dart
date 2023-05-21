import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tabuleiro/core/ui/widgets/app_image_net.dart';
import 'package:tabuleiro/core/ui/widgets/dialog_logout.dart';
import './game_list_controller.dart';

class GameListPage extends GetView<GameListController> {
  const GameListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogos'),
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
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 100),
                delegate: SliverChildBuilderDelegate(
                  childCount: controller.gameList.length,
                  (BuildContext context, int index) {
                    if (index == controller.gameList.length - 2) {
                      controller.getListGames();
                    }
                    final game = controller.gameList[index];
                    return Card(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => Get.toNamed('/games/detail/${game.id}'),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              AppImageNet(
                                imageUrl: game.banner,
                                height: 80,
                                width: 80,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      game.name,
                                      style: context.textTheme.titleMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(game.year),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverLayoutBuilder(builder: (context, constraints) {
                if (controller.loading) {
                  return const SliverToBoxAdapter(
                    child: LinearProgressIndicator(),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox());
              })
            ],
          ),
        );
      }),
    );
  }
}
