import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_hr/Core/constants/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'cache_helper.dart';

class WebService {
  Dio publicDio = Dio();

  static WebService? _this;

  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }

  WebService._() {
    updateAuthorizationHeader();
    publicDio.options.baseUrl = AppConstants.baseUrl;
    publicDio.options.connectTimeout = const Duration(milliseconds: 30000);
    publicDio.options.sendTimeout = const Duration(milliseconds: 30000);
    publicDio.options.receiveTimeout = const Duration(milliseconds: 30000);
    publicDio.options.connectTimeout = const Duration(milliseconds: 30000);
    publicDio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
    // interceptors();
  }

  String get token {
    return SharedPref.get(key: "accessToken") ?? "";
  }

  void updateAuthorizationHeader() {
    publicDio.options.headers['Authorization'] = 'Bearer $token';
  }

  void interceptors() {
    publicDio.interceptors.clear();
    publicDio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        log("send request ${options.uri}");
        log("header ${options.headers}");
        log("data ${options.data}");
        log("query Parameters ${options.queryParameters}");
        return handler.next(options);
      },
      onError: (e, handler) {
        log("path ${e.requestOptions.path}");
        log("response ${e.response}");
        log("status Code ${e.response?.statusCode}");
        log("data ${e.response?.data}");
        return handler.next(e);
      },
      onResponse: (e, handler) {
        log("response data ${e.data}");
        return handler.next(e);
      },
    ));
  }

  void setToken(String newToken) {
    SharedPref.set(key: "accessToken", value: newToken);
    updateAuthorizationHeader();
  }
}
