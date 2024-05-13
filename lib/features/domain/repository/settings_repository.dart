abstract class SettingsRepositoryInterface {
  bool getIsDarkTheme();
  Future<void> setIsDark(bool isDark);
}
