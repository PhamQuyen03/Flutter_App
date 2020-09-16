import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/features/number_trivia/domain/entities/NumberTrivia.dart';
import 'package:flutter_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });
  // final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: "test");
  test('should get a random NumberTrivia', () async {
    //arrange
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tNumberTrivia));
    //act
    final result = await usecase(NoParams());
    //assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
