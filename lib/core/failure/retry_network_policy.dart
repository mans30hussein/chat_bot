import 'dart:io';

import 'package:dio/dio.dart';

class NetworkRetryPolicy {
  static bool shouldRetry(Object error) {
    if (error is DioException) {
      return {
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.connectionError,
      }.contains(error.type) || error.error is SocketException;
    }

    return false;
  }
}