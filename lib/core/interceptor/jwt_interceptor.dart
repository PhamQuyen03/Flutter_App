import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/authentication_service.dart';

class JwtInterceptor extends Interceptor {
  Dio dio;
  JwtInterceptor({@required this.dio});
  @override
  Future onRequest(RequestOptions options) async {
    dio.interceptors.requestLock.lock();
    String token = await AuthenticationService.getJwtToken();
    if (token != null) {
      dio.options.headers["Authorization"] = 'Bearer ' + token;
    }
    dio.interceptors.requestLock.unlock();
    return options;
  }
}
