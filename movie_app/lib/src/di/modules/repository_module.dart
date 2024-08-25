import 'package:injectable/injectable.dart';
import 'package:movie_app/src/data/data.dart';
import 'package:movie_app/src/domain/domain.dart';

@module
abstract class RepositoryModule {
  @lazySingleton
  MovieRepository movieRepository(
    MovieRemoteDataSource movieRemoteDataSource,
  ) =>
      MovieRepositoryImpl(
        movieRemoteDataSource,
      );
}
