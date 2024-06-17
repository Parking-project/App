abstract class TokensRepository{
  bool getIsAuthorize();
  String getAccessToken();
  String getRefreshToken();
  Future<void> setTokens(String access, String refersh);
  Future<void> logOut();
}