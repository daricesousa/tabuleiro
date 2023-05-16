import 'package:tabuleiro/models/game_model.dart';

abstract class GameService {
  Future<List<GameModel>> getListGames({int? page});
}
