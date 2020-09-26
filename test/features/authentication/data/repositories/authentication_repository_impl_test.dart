import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/models/api_response_model.dart';
import 'package:flutter_app/core/network/network_info.dart';
import 'package:flutter_app/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_app/features/authentication/data/models/login_response_model.dart';
import 'package:flutter_app/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthenticationRemoteDataSource extends Mock
    implements AuthenticationRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockAuthenticationRemoteDataSource mockAuthenticationRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;
  AuthenticationRepositoryImpl repository;
  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    mockAuthenticationRemoteDataSource =
        new MockAuthenticationRemoteDataSource();
    repository = new AuthenticationRepositoryImpl(
        networkInfo: mockNetworkInfo,
        remoteDataSource: mockAuthenticationRemoteDataSource);
  });

  group('requestLogin', () {
    final String phoneNumber = "0338004227";
    final String password = "1234567";
    final ApiResponseModel<LoginResponseModel> loginResponse =
        new ApiResponseModel<LoginResponseModel>(
            status: 1,
            message: "",
            dataCount: 0,
            totalCount: 0,
            data: new LoginResponseModel(
                sessionId: null,
                accessToken: null,
                refreshToken: null,
                user: null));
    test('should return NoInternetFailure when device is offline', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      //act
      var result = await repository.requestLogin(phoneNumber, password);
      //assert
      expect(result, equals(Left(NoInternetFailure())));
    });
    test('should return ServerFailure on ServerException', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockAuthenticationRemoteDataSource.sendLoginRequest(
              phoneNumber, password))
          .thenThrow(ServerException());
      //act
      var result = await repository.requestLogin(phoneNumber, password);
      //
      verify(mockAuthenticationRemoteDataSource.sendLoginRequest(
          phoneNumber, password));
      verifyNoMoreInteractions(mockAuthenticationRemoteDataSource);
      expect(result, equals(Left(ServerFailure())));
    });
    test('should return remote data on success', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockAuthenticationRemoteDataSource.sendLoginRequest(
              phoneNumber, password))
          .thenAnswer((_) async => loginResponse);
      //act
      var result = await repository.requestLogin(phoneNumber, password);
      //
      verify(mockAuthenticationRemoteDataSource.sendLoginRequest(
          phoneNumber, password));
      verifyNoMoreInteractions(mockAuthenticationRemoteDataSource);
      expect(result, Right(loginResponse));
    });
  });
  group('requestRegister', () {
    final String phoneNumber = "0338004227";
    final String password = "1234567";
    final String fullName = "dang minh duoc";
    final String email = "dangduoc@outlook.com";
    final ApiResponseModel<int> registerResponse = new ApiResponseModel<int>(
        status: 1, message: "", dataCount: 0, totalCount: 0, data: 1);
    test('should return NoInternetFailure when device is offline', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      //act
      var result = await repository.requestRegister(
          phoneNumber: phoneNumber,
          password: password,
          fullName: fullName,
          email: email);
      //assert
      expect(result, equals(Left(NoInternetFailure())));
    });
    test('should return ServerFailure on ServerException', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockAuthenticationRemoteDataSource.sendRegisterRequest(
              phoneNumber: phoneNumber,
              password: password,
              fullName: fullName,
              email: email))
          .thenThrow(ServerException());
      //act
      var result = await repository.requestRegister(
          phoneNumber: phoneNumber,
          password: password,
          fullName: fullName,
          email: email);
      //
      verify(mockAuthenticationRemoteDataSource.sendRegisterRequest(
          phoneNumber: phoneNumber,
          password: password,
          fullName: fullName,
          email: email));
      verifyNoMoreInteractions(mockAuthenticationRemoteDataSource);
      expect(result, equals(Left(ServerFailure())));
    });
    test('should return remote data on success', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockAuthenticationRemoteDataSource.sendRegisterRequest(
              phoneNumber: phoneNumber,
              password: password,
              fullName: fullName,
              email: email))
          .thenAnswer((_) async => registerResponse);
      //act
      var result = await repository.requestRegister(
          phoneNumber: phoneNumber,
          password: password,
          fullName: fullName,
          email: email);
      //assert
      verify(mockAuthenticationRemoteDataSource.sendRegisterRequest(
          phoneNumber: phoneNumber,
          password: password,
          fullName: fullName,
          email: email));
      verifyNoMoreInteractions(mockAuthenticationRemoteDataSource);
      expect(result, Right(registerResponse));
    });
  });
}
