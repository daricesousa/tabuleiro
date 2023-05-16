import 'package:tabuleiro/models/game_model.dart';

abstract class GameRepository {
  Future<List<GameModel>> getListGames({int? page});
}
