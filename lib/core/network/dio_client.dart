import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'interceptors/auth_interceptor.dart';

/// Base custom Dio client.
/// Nơi tập trung cấu hình base url, timeout và các interceptor.
class DioClient {
  late final Dio dio;

  DioClient({
    required String baseUrl,
    required AuthInterceptor authInterceptor,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    // Cấu hình Interceptors
    dio.interceptors.addAll([
      authInterceptor,
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ), // Chỉ log trong môi trường Debug
    ]);
  }
}
