import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_player_app/Features/audio_player/data/Repository/app_settings_repository.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final AppSettingsRepository _appSettingsRepository;

  ThemeBloc(this._appSettingsRepository) : super(const ThemeState()) {
    on<LoadThemeEvent>((event, emit) async {
      final savedModeStr = await _appSettingsRepository.getSetting(
        'theme_mode',
      );
      final savedPalette = await _appSettingsRepository.getSetting(
        'selected_palette',
      );

      final parsedThemeMode = savedModeStr == 'light'
          ? ThemeMode.light
          : savedModeStr == 'dark'
          ? ThemeMode.dark
          : state.themeMode;

      emit(
        ThemeState(
          themeMode: parsedThemeMode,
          selectedPalette: savedPalette ?? state.selectedPalette,
        ),
      );
    });

    on<ThemeModeChanged>((event, emit) async {
      emit(
        ThemeState(
          themeMode: event.themeMode,
          selectedPalette: state.selectedPalette,
        ),
      );
      await _appSettingsRepository.setSetting(
        'theme_mode',
        event.themeMode.name,
      );
    });

    on<ColorPaletteChanged>((event, emit) async {
      emit(
        ThemeState(
          themeMode: state.themeMode,
          selectedPalette: event.paletteName,
        ),
      );
      await _appSettingsRepository.setSetting(
        'selected_palette',
        event.paletteName,
      );
    });

    add(LoadThemeEvent());
  }
}
