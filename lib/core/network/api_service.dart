import 'package:chat_bot/core/network/api_constant.dart';
import 'package:dio/dio.dart';

class ApiService {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': ApiConstants.apiKey,
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

    return dio;
  }
}
