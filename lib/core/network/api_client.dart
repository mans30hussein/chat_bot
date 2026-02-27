import 'package:dio/dio.dart';

import 'api_constant.dart';

class ApiClient {
  late final Dio dio;

  ApiClient._();

  static Future<ApiClient> create() async {
    final instance = ApiClient._();
    await instance._initialize();
    return instance;
  }

  Future<void> _initialize() async {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'x-goog-api-key': ApiConstants.apiKey,
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  Future<Response<T>> get<T>({
    required String urlEndPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.get<T>(urlEndPoint, queryParameters: queryParameters);
  }

  Future<Response<T>> post<T>({
    required String urlEndPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.post<T>(
      urlEndPoint,
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Response<T>> put<T>({
    required String urlEndPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.put<T>(
      urlEndPoint,
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Response<T>> delete<T>({
    required String urlEndPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.delete<T>(
      urlEndPoint,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
