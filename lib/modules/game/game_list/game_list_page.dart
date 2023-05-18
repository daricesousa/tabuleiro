import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './game_list_controller.dart';

class GameListPage extends GetView<GameListController> {
  const GameListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jogos'),
        ),
        body: Obx(
          () => GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 100),
            itemCount: controller.gameList.length,
            itemBuilder: (context, index) {
              final game = controller.gameList[index];
              return InkWell(
                onTap: () => Get.toNamed('/games/detail/${game.id}'),
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            game.banner,
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(game.name,
                                style: context.textTheme.titleMedium,
                                overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 8),
                            Text(game.year),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
