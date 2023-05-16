abstract class AppStorage {
  dynamic get(String key);

  void set(String key, dynamic value);

  void delete(String key);

  void clear();
}
