import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zillow_mini/src/core/domain/service/preference_service.dart';
part 'localization_view_model.g.dart';

class LocalizationViewModel extends Cubit<AppLocale> {
  static const localeKey = 'locale_key';
  LocalizationViewModel(this._prefs) : super(AppLocale('en', 'US')){
    _init();
  }
  final PreferenceService _prefs;
  
  void changeLocale(String languageCode, [String? countryCode]) {
    final locale = AppLocale(languageCode, countryCode);
    emit(locale);
    _prefs.setValue(localeKey, locale , serializer: (l) => l.toJson(),);
  }
  
  Future<void> _init() async {
    final locale = await _prefs.getValue(localeKey, deserializer: AppLocale.fromJson);
    emit(locale ?? AppLocale('en', 'US'));
  }

}

@JsonSerializable()
class AppLocale {
  final String? languageCode;
  final String? countryCode;

  String get id => '${languageCode}_$countryCode';

  AppLocale(this.languageCode, this.countryCode);

  factory AppLocale.fromJson(Map<String, dynamic> json) => _$AppLocaleFromJson(json);

  Map<String, dynamic> toJson() => _$AppLocaleToJson(this);

  Locale toLocale() {
    return Locale(languageCode!, countryCode);
  }
}


