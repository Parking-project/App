import 'package:app/features/domain/repository/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository implements SettingsRepositoryInterface {
  SettingsRepository({required this.preferences});

  final SharedPreferences preferences;

  static const _isDarkThemeKey = "is_dark_theme";
  
  @override
  bool getIsDarkTheme() {
    final isSelected = preferences.getBool(_isDarkThemeKey);
    return isSelected?? false;
  }
  
  @override
  Future<void> setIsDark(bool isDark) async{
    await preferences.setBool(_isDarkThemeKey, isDark);
  }

}
