import 'package:injectable/injectable.dart';
import 'package:movie_app/src/data/data.dart';

@module
abstract class RemoteDataSourceModule {
  @lazySingleton
  MovieRemoteDataSource movieRepository() => MovieRemoteDataSource();
}
