import 'package:tabuleiro/core/exceptions/rest_client_exception.dart';
import 'package:tabuleiro/core/rest_client/rest_client.dart';
import 'package:tabuleiro/core/storage/app_storage.dart';
import 'package:uno/uno.dart';

class UnoClient implements RestClient {
  final _uno = Uno();
  final AppStorage _storage;

  UnoClient(this._storage);

  @override
  RestClient get auth {
    _uno.interceptors.request.use((req) {
      final token = _storage.get('token');
      req.headers['Authorization'] = "Bearer $token";
      return req;
    });
    return this;
  }

  @override
  RestClient get noAuth => this;

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? parameters,
  }) async {
    try {
      final res = await _uno.get(path, params: parameters ?? {});
      return res.data;
    } on UnoError catch (e, s) {
      throw RestClientException(
        statusCode: e.response?.status ?? 0,
        error: e.response?.data,
        stackTrace: s,
      );
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
  }) async {
    try {
      final res = await _uno.post(path,
          data: data ?? {},
          params: parameters ?? {},
          responseType: ResponseType.plain);
      return res.data;
    } on UnoError catch (e, s) {
      throw RestClientException(
        statusCode: e.response?.status ?? 0,
        error: e.response?.data,
        stackTrace: s,
      );
    }
  }
}
