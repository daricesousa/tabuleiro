import 'package:get/get.dart';
import 'package:tabuleiro/core/exceptions/rest_client_exception.dart';
import 'package:tabuleiro/core/storage/app_storage.dart';
import 'package:tabuleiro/core/ui/widgets/app_snack_bar.dart';
import 'package:tabuleiro/models/game_model.dart';
import 'package:tabuleiro/services/auth/game/game_service.dart';

class GameListController extends GetxController {
  final GameService _gameService;
  final gameList = <GameModel>[].obs;
  var nextPage = 0;
  var loading = false;

  GameListController(this._gameService);

  @override
  void onReady() async {
    getListGames();
    super.onReady();
  }

  Future<void> getListGames() async {
    if (loading) {
      return;
    }
    loading = true;
    try {
      final res = await _gameService.getListGames(page: nextPage);
      gameList.addAll(res);
      nextPage++;
    } on RestClientException {
      AppSnackBar.error('Erro de conexão com o servidor');
    } catch (e) {
      AppSnackBar.error('Erro ao buscar lista de jogos');
    }
    loading = false;
  }

  void logout() {
    final appStorage = Get.find<AppStorage>();
    appStorage.delete('token');
    Get.offAllNamed('/sign');
  }
}
