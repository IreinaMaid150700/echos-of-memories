import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../network/dio_client.dart';
import '../network/interceptors/auth_interceptor.dart';

@module
abstract class NetworkModule {
  // TODO: baseUrl nên lấy từ env (ví dụ flutter_dotenv)
  @lazySingleton
  @Named('baseUrl')
  String get baseUrl => 'https://api.example.com';

  /// Khởi tạo custom DioClient (nơi cấu hình timeout, base url, v.v...)
  @lazySingleton
  DioClient getDioClient(
    @Named('baseUrl') String baseUrl,
    AuthInterceptor authInterceptor,
  ) {
    return DioClient(baseUrl: baseUrl, authInterceptor: authInterceptor);
  }

  /// Expose raw Dio để sử dụng trong Retrofit/ApiService được tiện lợi
  @lazySingleton
  Dio dio(DioClient client) => client.dio;
}
