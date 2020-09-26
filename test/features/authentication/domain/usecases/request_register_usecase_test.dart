import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/models/api_response_model.dart';
import 'package:flutter_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_app/features/authentication/domain/usercases/request_register.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  MockAuthenticationRepository repository;
  RequestRegister usecase;
  final String phoneNumber = "0338004227";
  final String password = "123456";
  final String fullName = "dang minh duoc";
  final String email = "dangduoc@outlook.com";
  ApiResponseModel<int> tResponse = ApiResponseModel<int>(
      data: 1, status: 1, message: "", dataCount: 0, totalCount: 0);

  setUp(() {
    repository = new MockAuthenticationRepository();
    usecase = new RequestRegister(repository);
  });

  test('Should return LoginResponse', () async {
    when(repository.requestRegister(
      phoneNumber: phoneNumber,
      password: password,
      fullName: fullName,
      email: email,
    )).thenAnswer((_) async => Right(tResponse));

    //act
    var result = await usecase(Params(
        phoneNumber: phoneNumber,
        password: password,
        fullName: fullName,
        email: email));
    //assert
    verify(repository.requestRegister(
      phoneNumber: phoneNumber,
      password: password,
      fullName: fullName,
      email: email,
    ));
    verifyNoMoreInteractions(repository);
    expect(result, equals(Right(tResponse)));
  });
}
