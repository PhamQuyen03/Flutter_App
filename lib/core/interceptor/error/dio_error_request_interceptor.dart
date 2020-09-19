/*
Try to re-authorize request by getting new access token with stored refresh token in case the access token has expired
*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/interceptor/error/dio_request_error_handler.dart';
import 'package:flutter_app/core/services/authentication_service.dart';

import '../../../injection_container.dart';

class DioErrorRequestInterceptor extends Interceptor {
  final AuthenticationService auth = sl<AuthenticationService>();
  DioRequestErrorHandler unAuthorizedRequestHandler;
  DioErrorRequestInterceptor({@required DioRequestErrorHandler handler})
      : assert(handler != null),
        unAuthorizedRequestHandler = handler;

  @override
  Future onError(DioError err) async {
    if (_isUnAuthorizedError(err)) {
      if (await auth.isLoggedIn()) {
        return await unAuthorizedRequestHandler
            .handleUnAuthorizedError(err.request);
      }
    } else if (err.type == DioErrorType.RESPONSE) {
      print('hey');
      return err.response;
    } else
      return err;
  }

  _isUnAuthorizedError(DioError err) {
    if (err.type == DioErrorType.RESPONSE &&
        err.error != null &&
        err.response != null &&
        err.response.statusCode == 401) return true;
    return false;
  }
}
