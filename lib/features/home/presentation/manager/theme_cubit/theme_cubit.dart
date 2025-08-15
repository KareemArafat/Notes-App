import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  final String jsonKey = 'themeMode';

  void changeTheme(ThemeMode mode) {
    emit(mode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    var savedMode = json[jsonKey];
    if (savedMode == 'light') {
      return ThemeMode.light;
    } else if (savedMode == 'dark') {
      return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode mode) {
    if (mode == ThemeMode.light) {
      return {jsonKey: 'light'};
    } else if (mode == ThemeMode.dark) {
      return {jsonKey: 'dark'};
    } else {
      return {jsonKey: 'system'};
    }
  }
}
