import 'package:dio/dio.dart';
import 'package:flutter_app/core/services/authentication_service.dart';

import '../interceptor/error/dio_error_request_interceptor.dart';
import '../interceptor/error/dio_request_error_handler.dart';
import '../interceptor/jwt_interceptor.dart';

Map<String, dynamic> optHeader = {'content-type': 'application/json'};

var dio = new Dio(BaseOptions(connectTimeout: 30000, headers: optHeader))
  ..interceptors.addAll([
    InterceptorsWrapper(onRequest: (RequestOptions requestOptions) async {
      dio.interceptors.requestLock.lock();
      String token = await AuthenticationService.getJwtToken();
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer ' + token;
      }
      dio.interceptors.requestLock.unlock();
      return requestOptions;
    }),
    // DioErrorRequestInterceptor(handler: DioRequestErrorHandler(dio: dio)),
  ]);

class NetUtils {
  static Future get(String url, [Map<String, dynamic> params]) async {
    var response;

    //dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    var response = await dio.post(url, data: params);
    return response.data;
  }

  static Dio getDioInstance() {
    var _dio = dio;
    _dio.interceptors.add(JwtInterceptor(dio: _dio));
    _dio.interceptors.add(
        DioErrorRequestInterceptor(handler: DioRequestErrorHandler(dio: _dio)));
    return _dio;
  }
}
