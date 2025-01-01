import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/utils/ansi_color.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio) {
    // Attach the interceptor during initialization
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log(
            AnsiColor.colorize(
              "Request: [${options.method}] ${options.uri.toString()}",
              AnsiColor.magenta,
            ),
            name: "API REQUEST",
          );
          if (options.data != null) {
            log(
              AnsiColor.colorize(
                "Request Data: ${options.data}",
                AnsiColor.green,
              ),
              name: "API REQUEST",
            );
          }
          return handler.next(options); // Continue the request
        },
        onResponse: (response, handler) {
          log(
            AnsiColor.colorize(
              "Response: [${response.statusCode}] ${response.requestOptions.uri.toString()}",
              AnsiColor.blue,
            ),
            name: "API RESPONSE",
          );
          // log(
          //   AnsiColor.colorize(
          //     "Response Data: ${response.data}",
          //     AnsiColor.green,
          //   ),
          //   name: "API RESPONSE",
          // );
          return handler.next(response); // Continue the response
        },
        onError: (DioException error, handler) {
          log(
            AnsiColor.colorize(
              "Error: [${error.response?.statusCode}] ${error.requestOptions.uri.toString()}",
              AnsiColor.red,
            ),
            name: "API ERROR",
          );
          log(
            AnsiColor.colorize(
              "Error Details: ${error.message}",
              AnsiColor.yellow,
            ),
            name: "API ERROR",
          );
          if (error.response?.data != null) {
            log(
              AnsiColor.colorize(
                "Error Data: ${error.response?.data}",
                AnsiColor.red,
              ),
              name: "API ERROR",
            );
          }
          return handler.next(error); // Continue the error
        },
      ),
    );
  }

  Future<void> _setHeaders() async {
    String? token = CacheHelper.getData(key: CacheKeys.kToken);
    // String tokenDebug =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzEzNzAwNjc0fQ.hNrOSLZmvRdYEw8oAiHuRBvW7I2i_N11pc0KKeKyWrc";
    // LoggerHelper.debug(token ?? "");
    // log(token ?? "");
    log(
      AnsiColor.colorize(
        "$token",
        AnsiColor.white,
      ),
      name: "CURRENT USER TOKEN",
    );
    if (token != null && token.isNotEmpty) {
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.headers['Content-Type'] = "application/json";
    }
  }

  Future<dynamic> get({
    required String endPoint,
    CancelToken? cancelToken,
  }) async {
    await _setHeaders();
    var response = await dio.get(endPoint, cancelToken: cancelToken);
    return response.data;
  }

  Future<Map<String, dynamic>> getWithBody({
    required String endPoint,
    CancelToken? cancelToken,
    required var data,
  }) async {
    await _setHeaders();
    var response =
        await dio.get(endPoint, data: data, cancelToken: cancelToken);
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    required var data,
    bool needToken = false,
    CancelToken? cancelToken,
  }) async {
    if (!needToken) {
      await _setHeaders();
    }
    var response =
        await dio.post(endPoint, data: data, cancelToken: cancelToken);

    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required var data,
  }) async {
    await _setHeaders();
    var response = await dio.put(endPoint, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> patch({
    required String endPoint,
    required var data,
  }) async {
    await _setHeaders();
    var response = await dio.patch(endPoint, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    required String id,
  }) async {
    await _setHeaders();
    var response = await dio.delete('$endPoint$id');
    return response.data;
  }

  Future<Map<String, dynamic>> deleteWithBody({
    required String endPoint,
    var data,
  }) async {
    await _setHeaders();
    var response = await dio.delete(endPoint, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> deleteMany({
    required String endPoint,
    required var data,
  }) async {
    await _setHeaders();
    var response = await dio.delete(endPoint, data: data);
    return response.data;
  }
}
