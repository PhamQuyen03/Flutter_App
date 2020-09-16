import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInt(str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
