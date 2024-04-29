import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_hr/Core/constants/app_constants.dart';

class WebService {
  String get token{
    return AppConstants.accessToken;
  }
  Dio publicDio = Dio();

  static WebService? _this;

  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }

  WebService._() {
    publicDio.options.headers=  {
      'Authorization': 'Bearer $token',
    };
    publicDio.options.baseUrl = AppConstants.baseUrl;
    publicDio.options.connectTimeout = const Duration(milliseconds: 30000);
    publicDio.options.sendTimeout = const Duration(milliseconds: 30000);
    publicDio.options.receiveTimeout = const Duration(milliseconds: 30000);
    publicDio.options.connectTimeout = const Duration(milliseconds: 30000);

    interceptors();
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
}
