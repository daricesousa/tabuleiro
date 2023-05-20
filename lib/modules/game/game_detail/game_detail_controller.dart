import 'package:get/get.dart';
import 'package:tabuleiro/core/exceptions/rest_client_exception.dart';
import 'package:tabuleiro/core/ui/widgets/app_snack_bar.dart';
import 'package:tabuleiro/models/game_model.dart';
import 'package:tabuleiro/services/auth/game/game_service.dart';

class GameDetailController extends GetxController {
  final GameService _gameService;
  final _idGame = Get.parameters['id'];
  final loading = false.obs;
  final _game = Rxn<GameModel>();

  @override
  void onReady() {
    getGame();
    super.onReady();
  }

  GameModel? get game => _game.value;

  GameDetailController(this._gameService);

  void getGame() async {
    loading.value = true;
    try {
      final res = await _gameService.getGame(_idGame!);
      _game.value = res;
    } on RestClientException {
      Get.back();
      AppSnackBar.error('Erro de conexão com o servidor');
    } catch (e) {
      Get.back();
      AppSnackBar.error('Erro ao buscar jogo');
    } finally {
      loading.value = false;
    }
  }
}
