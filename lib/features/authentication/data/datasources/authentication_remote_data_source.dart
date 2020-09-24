import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/api/api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/models/api_response_model.dart';
import '../models/login_response_model.dart';
import '../models/token_response_model.dart';
import 'package:http/http.dart' as http;

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

  /// Send request new token to [Api.REGISTER] enpoint
  /// @Return [UserId]
  /// Throws a [ServerException] for all error codes
  Future<ApiResponseModel<int>> sendRegisterRequest(
      {String phoneNumber, String password, String fullName, String email});
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final http.Client client;
  AuthenticationRemoteDataSourceImpl({@required this.client});
  @override
  Future<ApiResponseModel<LoginResponseModel>> sendLoginRequest(
      String phoneNumber, String password) async {
    var either = await sendPostRequest(Api.LOGIN, {
      'phoneNumber': phoneNumber,
      'password': password,
    });
    return either.fold((l) => throw l, (r) {
      return ApiResponseModel.fromJson(
        r,
        LoginResponseModel.fromJson(r['data']),
      );
    });
  }

  @override
  Future<ApiResponseModel<TokenResponseModel>> sendRefreshTokenRequest(
      String token, String refreshToken, String codeChallenge) async {
    var either = await sendPostRequest(Api.REFRESH_TOKEN, {
      'token': token,
      'refreshToken': refreshToken,
      'code_challenge': codeChallenge
    });
    return either.fold((l) => throw l, (r) {
      return ApiResponseModel.fromJson(
        r,
        TokenResponseModel.fromJson(r["data"]),
      );
    });
  }

  @override
  Future<ApiResponseModel<int>> sendRegisterRequest({
    String phoneNumber,
    String password,
    String fullName,
    String email,
  }) async {
    var either = await sendPostRequest(Api.REGISTER, <String, String>{
      'phoneNumber': phoneNumber,
      'password': password,
      'fullName': fullName,
      'email': email,
    });
    return either.fold((l) => throw l, (r) {
      return ApiResponseModel.fromJson(
        r,
        r["data"],
      );
    });
  }

  Future<Either<ServerException, Map<String, dynamic>>> sendPostRequest(
      String url, Map<String, dynamic> data) async {
    final http.Response response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Right(jsonDecode(response.body));
    } else
      return Left(ServerException());
  }
}
