import 'package:tabuleiro/models/enums/game_features_enum.dart';

class GameFeaturesModel {
  final String id;
  final GameFeaturesEnum type;
  final String description;
  final bool imported;
  final String importSourceType;
  final DateTime registrationDate;

  GameFeaturesModel({
    required this.id,
    required this.type,
    required this.description,
    required this.imported,
    required this.importSourceType,
    required this.registrationDate,
  });

  factory GameFeaturesModel.fromMap(map) {
    return GameFeaturesModel(
      id: map["id"].toString(),
      type: GameFeaturesEnum.fromString(map["tipo"]),
      description: map["descricao"],
      imported: map["importado"],
      importSourceType: map["tipoFonteImportacao"],
      registrationDate: DateTime.parse(map["dataCadastro"]),
    );
  }
}
