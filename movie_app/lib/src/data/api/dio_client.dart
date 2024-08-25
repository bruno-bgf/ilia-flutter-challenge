import 'package:dio/dio.dart';
import 'package:movie_app/src/data/api/api_endpoints.dart';
import 'package:movie_app/src/data/api/dio_interceptor.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(DioInterceptor());
  }

  // Get:
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
