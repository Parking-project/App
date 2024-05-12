import 'package:app/repositories/settings/settings_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository implements SettingsRepositoryInterface {
  SettingsRepository({required this.preferences});

  final SharedPreferences preferences;

  static const _isDarkThemeSelectedKey = "is_dark_theme_selected";

  @override
  bool isDarkThemeSelected() {
    final selected = preferences.getBool(_isDarkThemeSelectedKey);
    return selected?? false;
  }

  @override
  Future<void> setIsDarkThemeSelected(bool selected) async{
    await preferences.setBool(_isDarkThemeSelectedKey, selected);
  }
}
