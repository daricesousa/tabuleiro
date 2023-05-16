import 'package:get/get.dart';
import 'package:tabuleiro/repositories/game/game_repository.dart';
import 'package:tabuleiro/repositories/game/game_repository_impl.dart';
import 'package:tabuleiro/services/auth/game/game_service.dart';
import 'package:tabuleiro/services/auth/game/game_service_impl.dart';
import './game_list_controller.dart';

class GameListBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GameRepository>(GameRepositoryImpl(Get.find()));
    Get.put<GameService>(GameServiceImpl(Get.find()));
    Get.put(GameListController(Get.find()));
  }
}
