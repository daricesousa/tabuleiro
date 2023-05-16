abstract class AuthService {
  Future<void> sign({
    required String email,
    required String password,
  });
}
