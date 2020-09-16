import 'dart:convert';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  NumberTriviaLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = NumberTriviaLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('getLastNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia_cached.json')));
    test(
        'should return NumberTrivia from SharedPreferences when there is one in the cache',
        () async {
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('trivia_cached.json'));
      final result = await dataSource.getLastNumberTrivia();
      verify(mockSharedPreferences.getString(CACHED_NUMBER_TRIVIA));
      expect(result, tNumberTriviaModel);
    });
    test('should throw CacheException when there is none in the cache',
        () async {
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      final call = dataSource.getLastNumberTrivia;
      //verify(mockSharedPreferences.getString(CACHED_NUMBER_TRIVIA));
      expect(() => call(), throwsA(isA<CacheException>()));
    });
  });
  group('cacheNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel(number: 1, text: 'Test Trivia');
    test('should call SharedPrefereces to cache data', () {
      dataSource.cacheNumberTrivia(tNumberTriviaModel);
      final expect_json = json.encode(tNumberTriviaModel.toJson());
      verify(
          mockSharedPreferences.setString(CACHED_NUMBER_TRIVIA, expect_json));
    });
  });
}
