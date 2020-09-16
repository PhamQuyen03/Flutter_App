import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecases/usecase.dart';

import '../../../../core/ultis/input_converter.dart';
import '../../domain/entities/NumberTrivia.dart';
import '../../domain/usecases/get_concrete_number_trivia.dart';
import '../../domain/usecases/get_random_number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;
  NumberTriviaBloc(
      {@required GetConcreteNumberTrivia concrete,
      @required GetRandomNumberTrivia random,
      @required this.inputConverter})
      : assert(concrete != null),
        assert(random != null),
        assert(inputConverter != null),
        getConcreteNumberTrivia = concrete,
        getRandomNumberTrivia = random,
        super(Empty());
  @override
  Stream<NumberTriviaState> mapEventToState(
    NumberTriviaEvent event,
  ) async* {
    if (event is GetConcreteNumberTriviaEvent) {
      yield* _mapGetConcrete(event.numberString);
    } else if (event is GetRandomNumberTriviaEvent) {
      yield* _mapRandom();
    }
  }

  Stream<NumberTriviaState> _mapGetConcrete(String numberString) async* {
    final inputEdither = inputConverter.stringToUnsignedInt(numberString);
    yield* inputEdither.fold((l) async* {
      yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
    }, (r) async* {
      yield Loading();
      final failureOrTrivia = await getConcreteNumberTrivia(Params(number: r));
      yield* _eitherLoadedOrErrorState(failureOrTrivia);
    });
  }

  Stream<NumberTriviaState> _mapRandom() async* {
    yield Loading();
    final failureOrTrivia = await getRandomNumberTrivia(NoParams());
    yield* _eitherLoadedOrErrorState(failureOrTrivia);
  }

  Stream<NumberTriviaState> _eitherLoadedOrErrorState(
    Either<Failure, NumberTrivia> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (l) => Error(message: _mapFailureToMessage(l)),
      (r) => Loaded(trivia: r),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
