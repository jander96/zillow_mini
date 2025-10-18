import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/data/local/preferences/shared_preferences.dart';
import 'package:zillow_mini/src/core/domain/service/preference_service.dart';

class ThemeViewModel extends Cubit<AppThemeMode> {
  ThemeViewModel(this._prefs) : super(AppThemeMode.light) {
    init();
  }

  static const themeKey = 'theme_key';
  final PreferenceService _prefs;

  void toggleTheme() {
    final newState = ~state;
    _prefs.setValue(themeKey, newState.name);
    emit(newState);
  }

  Future<void> init() async {
    final theme = await _prefs.getValue<String>(themeKey);
    emit(AppThemeMode.fromName(theme));
  }
}

enum AppThemeMode {
  light,
  dark;

  bool get isDark => this == dark;

  static AppThemeMode fromName(String? name) {
    switch (name) {
      case 'light':
        return light;
      case 'dark':
        return dark;
      default:
        return light;
    }
  }

  AppThemeMode operator ~() {
    return this == light ? dark : light;
  }
}
