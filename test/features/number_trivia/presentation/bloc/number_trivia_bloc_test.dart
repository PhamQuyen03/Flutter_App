import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/ultis/input_converter.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/features/number_trivia/domain/entities/NumberTrivia.dart';
import 'package:flutter_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_app/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  NumberTriviaBloc bloc;
  MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  MockInputConverter mockInputConverter;
  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();
    bloc = NumberTriviaBloc(
        concrete: mockGetConcreteNumberTrivia,
        random: mockGetRandomNumberTrivia,
        inputConverter: mockInputConverter);
  });
  test('initialState should be Empty', () async {
    expect(bloc.state, Empty());
  });
  group('getConcreteNumberTrivia', () {
    final String tNumberString = '1';
    final int tNumberParsed = 1;
    final NumberTrivia tNumberTrivia =
        NumberTrivia(text: 'Test Text', number: 1);

    void setUpMockInputConverterSuccess() =>
        when(mockInputConverter.stringToUnsignedInt(any))
            .thenReturn(Right(tNumberParsed));
    test(
      'should call the InputConverter to validate and convert the string to an unsigned integer',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        // act
        bloc.add(GetConcreteNumberTriviaEvent(tNumberString));
        await untilCalled(mockInputConverter.stringToUnsignedInt(any));
        // assert
        verify(mockInputConverter.stringToUnsignedInt(tNumberString));
      },
    );
    blocTest('should emit [Error] when the input feild is invalid',
        build: () {
          when(mockInputConverter.stringToUnsignedInt(any))
              .thenReturn(Left(InvalidInputFailure()));
          return bloc;
        },
        act: (b) => b.add(GetConcreteNumberTriviaEvent(tNumberString)),
        expect: [
          Error(
            message: INVALID_INPUT_FAILURE_MESSAGE,
          )
        ]);
    test('should get data from concrete use case', () async {
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));

      //act
      bloc.add(GetConcreteNumberTriviaEvent(tNumberString));

      await untilCalled(mockGetConcreteNumberTrivia(any));
      //assert
      verify(mockGetConcreteNumberTrivia(Params(number: tNumberParsed)));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));

      final expected = [
        Loading(),
        Loaded(trivia: tNumberTrivia),
      ];

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetConcreteNumberTriviaEvent(tNumberString));
    });
    test('should emit [Loading, Error] when data is gotten unsuccessfully',
        () async {
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => Left(ServerFailure()));

      final expected = [
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE),
      ];

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetConcreteNumberTriviaEvent(tNumberString));
    });
    test(
        'should emit [Loading, Error] with a proper messsage when data is gotten unsuccessfully',
        () async {
      setUpMockInputConverterSuccess();
      when(mockGetConcreteNumberTrivia(any))
          .thenAnswer((_) async => Left(CacheFailure()));

      final expected = [
        Loading(),
        Error(message: CACHE_FAILURE_MESSAGE),
      ];

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetConcreteNumberTriviaEvent(tNumberString));
    });
  });

  group('getRandomNumberTrivia', () {
    final NumberTrivia tNumberTrivia =
        NumberTrivia(text: 'Test Text', number: 1);
    test('should get data from random use case', () async {
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));

      //act
      bloc.add(GetRandomNumberTriviaEvent());

      await untilCalled(mockGetRandomNumberTrivia(any));
      //assert
      verify(mockGetRandomNumberTrivia(NoParams()));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));

      final expected = [
        Loading(),
        Loaded(trivia: tNumberTrivia),
      ];

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetRandomNumberTriviaEvent());
    });
    test('should emit [Loading, Error] when data is gotten unsuccessfully',
        () async {
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Left(ServerFailure()));

      final expected = [
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE),
      ];

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetRandomNumberTriviaEvent());
    });
    test(
        'should emit [Loading, Error] with a proper messsage when data is gotten unsuccessfully',
        () async {
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Left(CacheFailure()));

      final expected = [
        Loading(),
        Error(message: CACHE_FAILURE_MESSAGE),
      ];

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetRandomNumberTriviaEvent());
    });
  });
}
