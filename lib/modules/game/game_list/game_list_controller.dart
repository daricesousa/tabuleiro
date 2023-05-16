import 'package:get/get.dart';
import 'package:tabuleiro/core/exceptions/rest_client_exception.dart';
import 'package:tabuleiro/core/ui/widgets/app_snack_bar.dart';
import 'package:tabuleiro/services/auth/game/game_service.dart';

class GameListController extends GetxController {
  final GameService _gameService;

  GameListController(this._gameService);

  @override
  void onInit() async {
    getListGames();
    super.onInit();
  }

  Future<void> getListGames() async {
    try {
      final res = await _gameService.getListGames();
      print(res);
    } on RestClientException {
      AppSnackBar.error('Erro de conexão com o servidor');
    } catch (e) {
      AppSnackBar.error('Erro ao buscar lista de jogos');
    }
  }
}
