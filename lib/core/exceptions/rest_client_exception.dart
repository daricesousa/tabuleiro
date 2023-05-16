class RestClientException implements Exception {
  final int statusCode;
  final dynamic error;
  final StackTrace stackTrace;
  RestClientException({
    required this.statusCode,
    required this.error,
    required this.stackTrace,
  });
}
