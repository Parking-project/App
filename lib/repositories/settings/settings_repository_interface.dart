abstract interface class SettingsRepositoryInterface{
  bool isDarkThemeSelected();
  Future<void> setIsDarkThemeSelected(bool selected);
}