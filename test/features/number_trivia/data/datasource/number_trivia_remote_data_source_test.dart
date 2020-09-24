import 'dart:convert';

import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  NumberTriviaRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });
  void mockSetUpHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('trivia/trivia.json'), 200));
  }

  void mockSetUpHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Not found', 404));
  }

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia/trivia.json')));
    test('''should peform a GET request on a URL with number
    being the enpoint and with application/json header
    ''', () async {
      //arrange
      mockSetUpHttpClientSuccess200();
      //act
      dataSource.getConcreteNumberTrivia(tNumber);
      //assert
      verify(mockHttpClient.get('http://numbersapi.com/$tNumber', headers: {
        'Content-Type': 'application/json',
      }));
    });

    test('should return NumberTrivia when the response status is 200',
        () async {
      //arrange
      mockSetUpHttpClientSuccess200();
      //act
      final result = await dataSource.getConcreteNumberTrivia(tNumber);
      //assert
      expect(result, tNumberTriviaModel);
    });

    test(
        'should throw ServerException when the response status is 404 or other',
        () async {
      //arrange
      mockSetUpHttpClientFailure404();
      //act
      final call = dataSource.getConcreteNumberTrivia;
      //assert
      expect(() => call(tNumber), throwsA(isA<ServerException>()));
    });
  });
  group('getRandomNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia/trivia.json')));
    test('''should peform a GET request on a URL with number
    being the enpoint and with application/json header
    ''', () async {
      //arrange
      mockSetUpHttpClientSuccess200();
      //act
      dataSource.getRandomNumberTrivia();
      //assert
      verify(mockHttpClient.get('http://numbersapi.com/random', headers: {
        'Content-Type': 'application/json',
      }));
    });

    test('should return NumberTrivia when the response status is 200',
        () async {
      //arrange
      mockSetUpHttpClientSuccess200();
      //act
      final result = await dataSource.getRandomNumberTrivia();
      //assert
      expect(result, tNumberTriviaModel);
    });

    test(
        'should throw ServerException when the response status is 404 or other',
        () async {
      //arrange
      mockSetUpHttpClientFailure404();
      //act
      final call = dataSource.getRandomNumberTrivia;
      //assert
      expect(() => call(), throwsA(isA<ServerException>()));
    });
  });
}
