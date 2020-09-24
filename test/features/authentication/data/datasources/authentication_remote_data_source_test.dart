import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/core/api/api.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/models/api_response_model.dart';
import 'package:flutter_app/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_app/features/authentication/data/models/login_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  AuthenticationRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = new MockHttpClient();
    dataSource = AuthenticationRemoteDataSourceImpl(client: mockHttpClient);
  });

  // void mockSetUpHttpClientSuccess200() {
  //   when(mockDio.post(any))
  //       .thenAnswer((_) async => Response(statusCode: 200, data: any));
  // }

  // void mockSetUpHttpClientFailure404() {
  //   when(mockDio.get(any)).thenAnswer(
  //       (_) async => Response(statusCode: 404, statusMessage: "Not found"));
  // }

  group("sendRegisterRequest", () {
    final String phoneNumber = "0338004227";
    final String password = "123456";
    final String fullName = "dang minh duoc";
    final String email = "dangduoc@outlook.com";
    final tResponse = ApiResponseModel<int>(
        status: 1, message: "", data: 1, dataCount: 0, totalCount: 0);
    test('should return ApiResponseModel<int> when response status is 200',
        () async {
      //arrange
      when(
        mockHttpClient.post(Api.REGISTER,
            headers: anyNamed("headers"), body: anyNamed("body")),
      ).thenAnswer((_) async => http.Response(
            jsonEncode(tResponse),
            200,
          ));

      //act
      var result = await dataSource.sendRegisterRequest(
        phoneNumber: phoneNumber,
        password: password,
        fullName: fullName,
        email: email,
      );
      //assert
      expect(result, isA<ApiResponseModel<int>>());
      expect(result, tResponse);
    });

    test(
        'should throw ServerException when the response status is 404 or other',
        () async {
      //arrange
      when(
        mockHttpClient.post(Api.REGISTER,
            headers: anyNamed("headers"), body: anyNamed("body")),
      ).thenAnswer((_) async => http.Response("Not Found", 404));

      //act
      final call = dataSource.sendRegisterRequest;
      //assert
      expect(
          () => call(
                phoneNumber: phoneNumber,
                password: password,
                fullName: fullName,
                email: email,
              ),
          throwsA(isA<ServerException>()));
    });
  });

  group("sendLoginRequest", () {
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
    test(
        'should return ApiResponseModel<LoginResponseModel> when response status is 200',
        () async {
      //arrange
      when(
        mockHttpClient.post(Api.LOGIN,
            headers: anyNamed("headers"), body: anyNamed("body")),
      ).thenAnswer((_) async => http.Response(jsonEncode(tResponse), 200,
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
              }));

      //act
      var result = await dataSource.sendLoginRequest(
        phoneNumber,
        password,
      );
      //assert
      expect(result, isA<ApiResponseModel<LoginResponseModel>>());
      expect(result.data, tLoginResponse);
    });
    test('should throw ServerException when response status is 404 or other',
        () async {
      //arrange
      when(
        mockHttpClient.post(Api.LOGIN,
            headers: anyNamed("headers"), body: anyNamed("body")),
      ).thenAnswer((_) async => http.Response("Not Found", 404, headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
          }));

      //act
      var call = dataSource.sendLoginRequest;
      //assert
      expect(
          () => call(phoneNumber, password), throwsA(isA<ServerException>()));
    });
  });
}
