import 'package:tabuleiro/core/rest_client/rest_client.dart';
import 'package:tabuleiro/env.dart';
import 'package:tabuleiro/models/game_model.dart';
import 'package:tabuleiro/repositories/game/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  final RestClient _restClient;
  final _baseUrl = Env.BASE_URL;

  GameRepositoryImpl(this._restClient);

  @override
  Future<List<GameModel>> getListGames({int? page}) async {
    final res = await _restClient.auth.get(
      '$_baseUrl/api/jogo/',
      parameters: {'page': page.toString()},
    );
    final data = res["content"] as List;
    final list = data.map((e) => GameModel.fromMap(e)).toList();
    return list;
  }
}
