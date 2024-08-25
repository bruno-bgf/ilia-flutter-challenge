import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/data/data.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() => Dio();

  @lazySingleton
  DioClient dioClient(Dio dio) => DioClient(dio);
}
