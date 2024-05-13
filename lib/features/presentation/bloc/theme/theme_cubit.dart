import 'package:app/features/domain/repository/settings_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required SettingsRepositoryInterface settingsRepository,
  })  : _settingsrepository = settingsRepository,
        super(const ThemeState(Brightness.light)){
          _heckSelectedTheme();
        }

  final SettingsRepositoryInterface _settingsrepository;

  Future<void> setThemeBrightness(Brightness brightness) async {
    emit(ThemeState(brightness));
    _settingsrepository.setIsDark(brightness == Brightness.dark);
  }

  void _heckSelectedTheme() {
    final brightness = _settingsrepository.getIsDarkTheme()
        ? Brightness.dark
        : Brightness.light;
    emit(ThemeState(brightness));
  }
}
