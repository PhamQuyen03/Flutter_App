import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/models/api_response_model.dart';
import 'package:flutter_app/features/authentication/data/models/login_response_model.dart';
import 'package:flutter_app/features/authentication/domain/entities/login_response.dart';
import 'package:flutter_app/features/authentication/domain/entities/user_session.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  /// Send login request to https://host/authenticate/login enpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<ApiResponseModel<LoginResponseModel>> sendLoginRequest(
      String phoneNumber, String password);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final http.Client client;
  AuthenticationRemoteDataSourceImpl({@required this.client});

  @override
  Future<ApiResponseModel<LoginResponseModel>> sendLoginRequest(
          String phoneNumber, String password) =>
      _sendRequest('https://apidemo.yodovn.com/api/authenticate/login',
          phoneNumber, password);

  Future<ApiResponseModel<LoginResponseModel>> _sendRequest(
      String url, String phoneNumber, String password) async {
    print(phoneNumber);
    String _json = jsonEncode(
      <String, String>{'userName': phoneNumber, 'password': password},
    );
    // print(_json);
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: _json,
    );
    // print(response.body);
    if (response.statusCode == 200) {
      var tmp = json.decode(response.body);
      return ApiResponseModel.fromJson(
          tmp, LoginResponseModel.fromJson(tmp['data']));
    } else
      throw ServerException();
  }
}
