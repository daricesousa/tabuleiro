import 'package:tabuleiro/models/enums/game_features_enum.dart';
import 'package:tabuleiro/models/game_features_model.dart';

class GameModel {
  final String id;
  final String name;
  final String? banner;
  final String description;
  final String year;
  final int minPlayers;
  final int maxPlayers;
  final int? averageDurationMinutes;
  final bool expansion;
  final List<GameFeaturesModel> features;

  GameModel({
    required this.id,
    required this.name,
    required this.banner,
    required this.year,
    required this.minPlayers,
    required this.maxPlayers,
    required this.averageDurationMinutes,
    required this.description,
    required this.expansion,
    required this.features,
  });

  factory GameModel.fromMap(map) {
    return GameModel(
      id: map["id"].toString(),
      name: map["nome"],
      banner: map["urlCapa"],
      year: map["ano"].toString(),
      minPlayers: map["minimoJogadores"],
      maxPlayers: map["maximoJogadores"],
      averageDurationMinutes: map["duracaoMedia"],
      description: map["descricao"],
      expansion: map["expansao"],
      features: map["caracteristicas"]
          .map<GameFeaturesModel>((e) => GameFeaturesModel.fromMap(e))
          .toList(),
    );
  }

  List<GameFeaturesModel?>? get mechanics {
    final mechanics = features.map((e) {
      if (e.type == GameFeaturesEnum.mechanics) {
        return e;
      }
    }).toList();
    mechanics.removeWhere((e) => e == null);
    return mechanics;
  }

  @override
  String toString() {
    return "GameModel($id,$name)";
  }
}
