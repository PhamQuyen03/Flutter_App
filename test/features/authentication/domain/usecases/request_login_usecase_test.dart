import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/models/api_response_model.dart';
import 'package:flutter_app/features/authentication/data/models/login_response_model.dart';
import 'package:flutter_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_app/features/authentication/domain/usercases/request_login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  MockAuthenticationRepository repository;
  RequestLogin usecase;
  final String phoneNumber = "0338004227";
  final String password = "123456";
  final tLoginResponse = LoginResponseModel.fromJson(
      json.decode(fixture('authentication/login_response.json')));
  ApiResponseModel<LoginResponseModel> tResponse =
      ApiResponseModel<LoginResponseModel>(
          data: tLoginResponse,
          status: 1,
          message: "",
          dataCount: 0,
          totalCount: 0);

  setUp(() {
    repository = new MockAuthenticationRepository();
    usecase = new RequestLogin(repository);
  });

  test('Should return LoginResponse', () async {
    when(repository.requestLogin(phoneNumber, password))
        .thenAnswer((_) async => Right(tResponse));

    //act
    var result = await usecase(Params(phoneNumber, password));
    //assert
    verify(repository.requestLogin(phoneNumber, password));
    verifyNoMoreInteractions(repository);
    expect(result, equals(Right(tResponse)));
  });
}
