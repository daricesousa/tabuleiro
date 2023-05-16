import 'package:tabuleiro/core/storage/app_storage.dart';
import 'package:tabuleiro/repositories/auth/auth_repository.dart';
import 'package:tabuleiro/services/auth/auth_service.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository _authRepository;
  final AppStorage _appStorage;

  AuthServiceImpl(this._authRepository, this._appStorage);

  @override
  Future<void> sign({
    required String email,
    required String password,
  }) async {
    final res = await _authRepository.sign(
      email: email,
      password: password,
    );
    _appStorage.set("token", res);
  }
}
