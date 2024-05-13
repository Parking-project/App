abstract class TokensRepositoryInterface{
  String getAccessToken();
  String getRefreshToken();
  Future<void> setTokens(String access, String refersh);
}