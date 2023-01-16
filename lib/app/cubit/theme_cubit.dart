import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void light() => emit(ThemeMode.light);
  void dark() => emit(ThemeMode.dark);

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
   return ThemeMode.system;  json['theme_data'] as ThemeMode;
  }
    @override
    Map<String, dynamic> toJson(ThemeMode state) => { 'theme_data': state.toString() };
}