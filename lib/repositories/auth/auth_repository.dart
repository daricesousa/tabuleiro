abstract class AuthRepository {
  Future<String> sign({
    required String email,
    required String password,
  });
}
