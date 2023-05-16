enum GameFeaturesEnum {
  mechanics('MECANICA'),
  category('CATEGORIA'),
  languageDependency('DEPENDENCIA_IDIOMA');

  final String name;
  const GameFeaturesEnum(this.name);

  static GameFeaturesEnum fromString(value) {
    return GameFeaturesEnum.values.firstWhere((e) => e.name == value);
  }
}
