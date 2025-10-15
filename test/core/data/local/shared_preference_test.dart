import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zillow_mini/src/core/data/local/preferences/shared_preferences.dart';
import 'shared_preference_test.mocks.dart';


@GenerateMocks([SharedPreferencesAsync])


void main() {

  late MockSharedPreferencesAsync mockPrefs;
  late SharedPreferenceService service;

  setUp(() {
    mockPrefs = MockSharedPreferencesAsync();
    service = SharedPreferenceService(mockPrefs);

    when(mockPrefs.setInt(any, any)).thenAnswer((_) async => true);
    when(mockPrefs.setDouble(any, any)).thenAnswer((_) async => true);
    when(mockPrefs.setBool(any, any)).thenAnswer((_) async => true);
    when(mockPrefs.setString(any, any)).thenAnswer((_) async => true);
    when(mockPrefs.setStringList(any, any)).thenAnswer((_) async => true);
    when(mockPrefs.remove(any)).thenAnswer((_) async => true);
    when(mockPrefs.clear()).thenAnswer((_) async => true);
  });

  group('setValue', () {
    const key = 'testKey';

    test('should call setInt for int values', () async {
      await service.setValue<int>(key, 42);
      verify(mockPrefs.setInt(key, 42)).called(1);
    });

    test('should call setDouble for double values', () async {
      await service.setValue<double>(key, 3.14);
      verify(mockPrefs.setDouble(key, 3.14)).called(1);
    });

    test('should call setBool for bool values', () async {
      await service.setValue<bool>(key, true);
      verify(mockPrefs.setBool(key, true)).called(1);
    });

    test('should call setString for String values', () async {
      await service.setValue<String>(key, 'hello');
      verify(mockPrefs.setString(key, 'hello')).called(1);
    });

    test('should call setStringList for List<String> values', () async {
      const list = ['a', 'b'];
      await service.setValue<List<String>>(key, list);
      verify(mockPrefs.setStringList(key, list)).called(1);
    });

    test('should serialize and call setString for complex objects with a serializer', () async {
      const myObject = {'id': 1, 'name': 'test'};

      Map<String, dynamic> serializer(Map<String, dynamic> value) => value;

      await service.setValue(key, myObject, serializer: serializer);

      verify(mockPrefs.setString(key, jsonEncode(myObject))).called(1);
    });

    test('should throw an exception for unsupported types without a serializer', () async {
      expect(
            () => service.setValue(key, DateTime.now()),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('getValue', () {
    const key = 'testKey';

    test('should return int correctly', () async {
      when(mockPrefs.getInt(key)).thenAnswer((realInvocation) => Future.value(42),);
      final result = await service.getValue<int>(key);
      expect(result, 42);
    });

    test('should return double correctly', () async {
      when(mockPrefs.getDouble(key)).thenAnswer((realInvocation) => Future.value(3.14),);
      final result = await service.getValue<double>(key);
      expect(result, 3.14);
    });

    test('should return bool correctly', () async {
      when(mockPrefs.getBool(key)).thenAnswer((realInvocation) => Future.value(true),);
      final result = await service.getValue<bool>(key);
      expect(result, true);
    });

    test('should return String correctly', () async {
      when(mockPrefs.getString(key)).thenAnswer((realInvocation) => Future.value('hello'),);
      final result = await service.getValue<String>(key);
      expect(result, 'hello');
    });

    test('should return List<String> correctly', () async {
      const list = ['a', 'b'];
      when(mockPrefs.getStringList(key)).thenAnswer((realInvocation) => Future.value(list),);
      final result = await service.getValue<List<String>>(key);
      expect(result, list);
    });

    test('should deserialize and return a complex object', () async {

      const objectString = '{"id": 1, "name": "test"}';
      when(mockPrefs.getString(key)).thenAnswer((realInvocation) => Future.value(objectString),);

      Map<String, dynamic> deserializer(Map<String, dynamic> json) => json;

      final result = await service.getValue<Map<String, dynamic>>(key, deserializer: deserializer);

      expect(result, {'id': 1, 'name': 'test'});
    });


    test('should throw an exception for unsupported types without a deserializer', () async {
      expect(
            () => service.getValue<DateTime>(key),
        throwsA(isA<Exception>()),
      );
    });
  });


  group('Management methods', () {
    const key = 'testKey';

    test('should call prefs.remove when calling remove', () async {
      await service.remove(key);
      verify(mockPrefs.remove(key)).called(1);
    });

    test('should call prefs.clear when calling clear', () async {
      await service.clear();
      verify(mockPrefs.clear()).called(1);
    });
  });
}