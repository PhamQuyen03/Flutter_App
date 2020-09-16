import 'dart:convert';

import 'package:flutter_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_app/features/number_trivia/domain/entities/NumberTrivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 45, text: "Test Text");
  test('Should be a subclass of NumberTrivia entity', () async {
    //assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });
  group('fromJson', () {
    test('should return a valid model when json number is a integer', () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      //act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert
      expect(result, tNumberTriviaModel);
    });
    test('should return a valid model when json number is a double', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));
      //act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert
      expect(result, tNumberTriviaModel);
    });
  });

  group('toJson', () {
    test('should return a valid json map', () async {
      //act
      final result = tNumberTriviaModel.toJson();
      final expectResult = {"text": "Test Text", "number": 45};
      //assert
      expect(result, expectResult);
    });
  });
}
