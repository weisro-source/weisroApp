import 'package:dio/dio.dart';
import 'package:weisro/core/utils/logger.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<void> _setHeaders() async {
    // String? token = await _getToken();
    // String? token = CacheHelper.getData(key: CacheKeys.kToken);
    String? token = "";
    // ignore: unused_local_variable
    String tokenDebug =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzEzNzAwNjc0fQ.hNrOSLZmvRdYEw8oAiHuRBvW7I2i_N11pc0KKeKyWrc";
    LoggerHelper.debug(token);

    if (token.isNotEmpty) {
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

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    required int id,
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
