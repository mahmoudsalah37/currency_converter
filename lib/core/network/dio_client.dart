import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_config.dart';

@lazySingleton
class DioClient {
  final Dio _dio;

  DioClient._(this._dio);

  @factoryMethod
  static Future<DioClient> create() async {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.exchangerate.host/',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['access_key'] = apiKey;
        return handler.next(options);
      },
    ));

    return DioClient._(dio);
  }

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }
}
