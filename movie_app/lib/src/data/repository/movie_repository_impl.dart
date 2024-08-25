import 'package:movie_app/src/data/api/dio_exception.dart';
import 'package:movie_app/src/data/data_sources/data_sources.dart';
import 'package:movie_app/src/domain/domain.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl(
    this.movieRemoteDataSource,
  );

  @override
  Future<List<MovieEntity>> getMovieList() async {
    try {
      return await movieRemoteDataSource.getMovieListList();
    } on DioExceptions catch (e) {
      throw e.message;
    }
  }
}
