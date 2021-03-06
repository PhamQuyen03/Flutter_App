import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/models/api_response_model.dart';
import 'package:flutter_app/features/authentication/domain/usercases/request_register.dart';

part 'register_event.dart';
part 'register_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RequestRegister requestLogin;
  RegisterBloc({@required RequestRegister requestLogin})
      : assert(requestLogin != null),
        this.requestLogin = requestLogin,
        super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is SendRegisterRequestEvent) {
      yield* _mapSendRegisterRequest(
          event.phoneNumber, event.password, event.fullName, event.email);
    }
    if (event is RegisterCheckPhoneNumberEvent) {
      //yield Empty();
    }
  }

  Stream<RegisterState> _mapSendRegisterRequest(String phoneNumber,
      String password, String fullName, String email) async* {
    // final inputEdither = inputConverter.stringToUnsignedInt(numberString);
    yield RegisterLoading();
    final failureOrResponse = await requestLogin(Params(
      phoneNumber: phoneNumber,
      password: password,
      fullName: fullName,
      email: email,
    ));
    yield* _eitherLoadedOrErrorState(failureOrResponse);
  }

  Stream<RegisterState> _eitherLoadedOrErrorState(
    Either<Failure, ApiResponseModel<int>> failureOrResponse,
  ) async* {
    yield failureOrResponse
        .fold((l) => RegisterError(message: _mapFailureToMessage(l)), (r) {
      if (r.status == 1) {
        return RegisterLoaded(r.data);
      } else if (r.status == 0) {
        return RegisterError(message: r.message);
      } else
        return RegisterError(message: "Something went wrong. Try later");
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
