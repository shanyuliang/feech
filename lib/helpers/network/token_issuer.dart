abstract class TokenIssuer {
  Future<String> getToken();

  Future<bool> refreshToken();
}
