import 'package:movie_app/src/domain/entities/entities.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovieList();
}
