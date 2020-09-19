import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/api/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/models/api_response_model.dart';
import '../models/login_response_model.dart';
import '../models/token_response_model.dart';

abstract class AuthenticationRemoteDataSource {
  /// Send login request to [Api.LOGIN] enpoint
  /// @Return [LoginResponseModel]
  /// Throws a [ServerException] for all error codes
  Future<ApiResponseModel<LoginResponseModel>> sendLoginRequest(
      String phoneNumber, String password);

  /// Send request new token to [Api.REFRESH_TOKEN] enpoint
  /// @Return [TokenResponseModel]
  /// Throws a [ServerException] for all error codes
  Future<ApiResponseModel<TokenResponseModel>> sendRefreshTokenRequest(
      String token, String refreshToken, String codeChallenge);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  var dio = new Dio();
  AuthenticationRemoteDataSourceImpl() {
    dio.interceptors.add(InterceptorsWrapper(
      onError: (e) {
        if (e.type == DioErrorType.RESPONSE)
          return e.response;
        else
          return e;
      },
    ));
  }
  @override
  Future<ApiResponseModel<LoginResponseModel>> sendLoginRequest(
      String phoneNumber, String password) async {
    //String bodyRes = await _sendPostRequest(Api.LOGIN, );
    final Response response = await dio.post(Api.LOGIN, data: {
      'phoneNumber': phoneNumber,
      'password': password,
    });
    if (response.statusCode == 200) {
      return ApiResponseModel.fromJson(
        response.data,
        LoginResponseModel.fromJson(
          response.data['data'],
        ),
      );
    } else
      throw ServerException();
  }

  @override
  Future<ApiResponseModel<TokenResponseModel>> sendRefreshTokenRequest(
      String token, String refreshToken, String codeChallenge) async {
    String bodyRes = await _sendPostRequest(Api.REFRESH_TOKEN, {
      'token': token,
      'refreshToken': refreshToken,
      'code_challenge': codeChallenge
    });
    // print(response.body);
    var tmp = json.decode(bodyRes);
    return ApiResponseModel.fromJson(
      tmp,
      TokenResponseModel.fromJson(
        tmp['data'],
      ),
    );
  }

  Future<String> _sendPostRequest(String url, Map<String, dynamic> data) async {
    final Response response = await dio.post(url, data: data);
    if (response.statusCode == 200)
      return response.data;
    else
      throw ServerException();
  }
}
