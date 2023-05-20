import 'package:tabuleiro/models/game_model.dart';
import 'package:tabuleiro/repositories/game/game_repository.dart';

import './game_service.dart';

class GameServiceImpl implements GameService {
  final GameRepository _gameRepository;

  GameServiceImpl(this._gameRepository);

  @override
  Future<List<GameModel>> getListGames({int? page}) async {
    final res = await _gameRepository.getListGames(page: page);
    return res;
  }

  @override
  Future<GameModel> getGame(String id) async {
    final res = await _gameRepository.getGame(id);
    return res;
  }
}
