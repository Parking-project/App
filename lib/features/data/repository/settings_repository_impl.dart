import 'package:app/di/service.dart';
import 'package:app/features/domain/repository/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl();

  static const _isDarkThemeKey = "is_dark_theme";
  
  @override
  bool getIsDarkTheme() {
    final isSelected = service<SharedPreferences>().getBool(_isDarkThemeKey);
    return isSelected?? false;
  }
  
  @override
  Future<void> setIsDark(bool isDark) async{
    await service<SharedPreferences>().setBool(_isDarkThemeKey, isDark);
  }

}
