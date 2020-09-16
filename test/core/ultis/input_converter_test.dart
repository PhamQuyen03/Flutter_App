import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/ultis/input_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  InputConverter numberConverter;
  setUp(() {
    numberConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
        'should return an interger when the string is represents as an unsigned integer',
        () {
      final tStringNumber = '123';
      final result = numberConverter.stringToUnsignedInt(tStringNumber);
      expect(result, Right(123));
    });
    test('should return a Failure when the string is not an integer', () {
      final tStringNumber = 'abc';
      final result = numberConverter.stringToUnsignedInt(tStringNumber);
      expect(result, Left(InvalidInputFailure()));
    });
    test('should return a Failure when the string is a negative integer', () {
      final tStringNumber = '-123';
      final result = numberConverter.stringToUnsignedInt(tStringNumber);
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
