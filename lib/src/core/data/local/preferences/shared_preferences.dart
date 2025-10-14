import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zillow_mini/src/core/domain/service/preference_service.dart';

@LazySingleton(as: PreferenceService)
class SharedPreferenceService implements PreferenceService {
  SharedPreferenceService(this._prefs);

  final SharedPreferencesAsync _prefs;

  @override
  Future<void> setValue<T>(String key, T value, {Map<String, dynamic> Function(T value)? serializer}) async {
    if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else if (serializer != null) {
      final jsonMap = serializer(value);
      final jsonString = jsonEncode(jsonMap);
      await _prefs.setString(key, jsonString);
    } else {
      throw Exception('Unsupported type: ${value.runtimeType}');
    }
  }

  @override
  Future<T?> getValue<T>(String key, {T Function(Map<String, dynamic> json)? deserializer}) async {
    if (T == int) {
      return _prefs.getInt(key) as Future<T?>;
    } else if (T == double) {
      return _prefs.getDouble(key) as Future<T?>;
    } else if (T == bool) {
      return _prefs.getBool(key) as Future<T?>;
    } else if (T == String) {
      return _prefs.getString(key) as Future<T?>;
    } else if (T == List<String>) {
      return _prefs.getStringList(key) as Future<T?>;
    } else if (deserializer != null) {
      final jsonString = await _prefs.getString(key);
      if (jsonString == null) return null;
      final decoded = jsonDecode(jsonString);
      if (decoded is Map<String, dynamic>) {
        return deserializer(decoded);
      }
    } else {
      throw Exception('Unsupported type: ${T.runtimeType}');
    }
    return null;
  }

  @override
  Future<void> clear()=> _prefs.clear();

  @override
  Future<void> remove(String key) => _prefs.remove(key);
}