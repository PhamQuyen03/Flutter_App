import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/models/api_response_model.dart';
import '../../../domain/entities/login_response.dart';
import '../../../domain/usercases/request_login.dart';

part 'login_event.dart';
part 'login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RequestLogin requestLogin;
  LoginBloc({@required RequestLogin requestLogin})
      : assert(requestLogin != null),
        this.requestLogin = requestLogin,
        super(Empty());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SendLoginRequestEvent) {
      yield* _mapSendLoginRequest(event.phoneNumber, event.password);
    }
  }

  Stream<LoginState> _mapSendLoginRequest(
      String phoneNumber, String password) async* {
    // final inputEdither = inputConverter.stringToUnsignedInt(numberString);
    yield Loading();
    final failureOrResponse = await requestLogin(Params(phoneNumber, password));
    yield* _eitherLoadedOrErrorState(failureOrResponse);
  }

  Stream<LoginState> _eitherLoadedOrErrorState(
    Either<Failure, ApiResponseModel<LoginResponse>> failureOrResponse,
  ) async* {
    yield failureOrResponse.fold((l) => Error(message: _mapFailureToMessage(l)),
        (r) {
      if (r.status == 1) {
        return Loaded(loginResponse: r.data);
      } else if (r.status == 0) {
        return Error(message: r.messsage);
      } else
        return Error(message: r.messsage);
    });
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
