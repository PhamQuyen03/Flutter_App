import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../injection_container.dart';
import '../../services/authentication_service.dart';

class DioRequestErrorHandler {
  final Dio dio;
  final AuthenticationService auth = sl<AuthenticationService>();

  DioRequestErrorHandler({@required this.dio});
  Future<Response> handleUnAuthorizedError(RequestOptions request) async {
    dio.interceptors.requestLock.lock();
    var token = await auth.requestNewToken();
    if (token == null) {
      await this.auth.logOut();
    } else {
      this.auth.storeTokens(Tokens(
          sessionId: token.sessionId,
          accessToken: token.accessToken,
          refreshToken: token.refreshToken));
      request.headers["Authorization"] = "Bearer " + token.accessToken;
    }
    dio.interceptors.requestLock.unlock();
    return dio.request(request.path, options: request);
  }
}
