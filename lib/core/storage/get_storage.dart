import 'package:tabuleiro/core/storage/app_storage.dart';
import 'package:get_storage/get_storage.dart' as GetS;

class GetStorage implements AppStorage {
  final _storage = GetS.GetStorage();

  @override
  void clear() {
    _storage.erase();
  }

  @override
  void delete(String key) {
    _storage.remove(key);
  }

  @override
  get(String key) {
    return _storage.read(key);
  }

  @override
  void set(String key, value) {
    _storage.write(key, value);
  }
}
