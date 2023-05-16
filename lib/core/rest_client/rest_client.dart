abstract class RestClient {
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? parameters,
  });

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, String>? parameters,
  });

  RestClient get auth;

  RestClient get noAuth;
}
