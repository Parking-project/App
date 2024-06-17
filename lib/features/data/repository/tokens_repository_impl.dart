import 'package:app/di/service.dart';
import 'package:app/features/domain/repository/tokens_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokensRepositoryImpl implements TokensRepository {
  TokensRepositoryImpl();

  static const _isAuthKey = "is_auth";
  static const _accessKey = "access_token";
  static const _refreshKey = "refresh_token";
  
  @override
  bool getIsAuthorize() {
    final refresh = service<SharedPreferences>().getBool(_isAuthKey);
    return refresh?? false;
  }

  @override
  String getAccessToken() {
    final access = service<SharedPreferences>().getString(_accessKey);
    return access?? "";
  }
  
  @override
  String getRefreshToken() {
    final refresh = service<SharedPreferences>().getString(_refreshKey);
    return refresh?? "";
  }
  
  @override
  Future<void> setTokens(String access, String refresh) async{
    await service<SharedPreferences>().setBool(_isAuthKey, true);
    await service<SharedPreferences>().setString(_accessKey, access);
    await service<SharedPreferences>().setString(_refreshKey, refresh);
  }
  
  
  @override
  Future<void> logOut() async{
    await service<SharedPreferences>().clear();
  }
}
