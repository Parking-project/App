import 'package:app/features/domain/repository/tokens_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokensRepository implements TokensRepositoryInterface {
  TokensRepository({required this.preferences});

  final SharedPreferences preferences;

  static const _accessKey = "access_token";
  static const _refreshKey = "refresh_token";
  
  @override
  String getAccessToken() {
    final access = preferences.getString(_accessKey);
    return access?? "";
  }
  
  @override
  String getRefreshToken() {
    final refresh = preferences.getString(_refreshKey);
    return refresh?? "";
  }
  
  @override
  Future<void> setTokens(String access, String refresh) async{
    await preferences.setString(_accessKey, access);
    await preferences.setString(_refreshKey, refresh);
  }

}
