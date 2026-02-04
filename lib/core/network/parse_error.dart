import 'package:dio/dio.dart';

/// Logger interface for Retrofit / Dio errors
abstract class ParseErrorLogger {
  void logError(
    Object error,
    StackTrace stackTrace,
    RequestOptions requestOptions, {
    Response<dynamic>? response, // Optional, required by Retrofit generated code
  });
}
class ConsoleErrorLogger implements ParseErrorLogger {
  @override
  void logError(
    Object error,
    StackTrace stackTrace,
    RequestOptions requestOptions, {
    Response<dynamic>? response,
  }) {
    print('--- Retrofit Error ---');
    print('Error: $error');
    print('StackTrace: $stackTrace');
    print('Request: ${requestOptions.method} ${requestOptions.path}');
    if (response != null) {
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
    }
    print('---------------------');
  }
}
