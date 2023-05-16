import 'package:tabuleiro/core/exceptions/auth_exception.dart';
import 'package:tabuleiro/core/exceptions/rest_client_exception.dart';
import 'package:tabuleiro/core/rest_client/rest_client.dart';
import 'package:tabuleiro/env.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;
  final _baseUrl = Env.BASE_URL;

  AuthRepositoryImpl(this._restClient);

  @override
  Future<String> sign({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _restClient.post(
        '$_baseUrl/login',
        data: {'email': email, 'senha': password},
      );
      return res;
    } on RestClientException catch (e) {
      if (e.statusCode == 401) {
        throw UnauthorizeException();
      }
      rethrow;
    }
  }
}
