import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zillow_mini/src/core/data/network/api/client.dart';
import 'package:zillow_mini/src/core/data/network/model/property_dto.dart';
import 'package:zillow_mini/src/core/data/repo/property_repo_impl.dart';
import 'package:zillow_mini/src/core/domain/models/property.dart';

import 'property_repo_test.mocks.dart';


@GenerateMocks([Client])


class MockPropertyDto extends Mock implements PropertyDto {
  @override
  MockProperty toDomain() => MockProperty();
}

class MockProperty extends Mock implements Property {}


void main() {
  late MockClient mockClient;
  late PropertyRepoImp repository;

  setUp(() {
    mockClient = MockClient();
    repository = PropertyRepoImp(client: mockClient);
  });


  group('getProperties', () {
    test('It must return a list of Property and call getProperties on the client.', () async {

      final mockDtos = [MockPropertyDto(), MockPropertyDto()];
      when(mockClient.getProperties(
        page: anyNamed('page'),
        limit: anyNamed('limit'),
        title: anyNamed('title'),
      )).thenAnswer((_) async => mockDtos);

      final result = await repository.getProperties(page: 1, limit: 10, query: 'test');

      verify(mockClient.getProperties(page: 1, limit: 10, title: 'test')).called(1);

      expect(result, isA<List<Property>>());
      expect(result.length, 2);

    });

    test('It should pass null to the client when the query is empty.', () async {
      when(mockClient.getProperties(
        title: anyNamed('title'),
      )).thenAnswer((_) async => []);
      await repository.getProperties(query: '');
      verify(mockClient.getProperties(title: null)).called(1);
    });

    test('Should pass null to the client when the query is null.', () async {
      when(mockClient.getProperties(
        title: anyNamed('title'),
      )).thenAnswer((_) async => []);
      await repository.getProperties(query: null);
      verify(mockClient.getProperties(title: null)).called(1);
    });
  });


  group('getProperty', () {
    const propertyId = 'p123';

    test('Should return a Right (Property) on success.', () async {

      final mockDto = MockPropertyDto();
      when(mockClient.getProperty(propertyId)).thenAnswer((_) async => mockDto);

      final result = await repository.getProperty(propertyId);

      verify(mockClient.getProperty(propertyId)).called(1);

      expect(result.isRight(), isTrue);

    });

    test('Should return a Left (Failure) if the client call fails.', () async {

      when(mockClient.getProperty(propertyId)).thenThrow(Exception('Network Error'));

      final result = await repository.getProperty(propertyId);

      expect(result.isLeft(), isTrue);

    });
  });
}