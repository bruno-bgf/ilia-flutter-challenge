import 'package:movie_app/src/data/data.dart';
import 'package:movie_app/src/domain/domain.dart';

class MovieUseCase {
  final MovieRepository movieRepository;

  const MovieUseCase({
    required this.movieRepository,
  });

  Future<List<MovieEntity>> getMovieList() async {
    try {
      return await movieRepository.getMovieList();
    } on DioExceptions catch (e) {
      throw e.message;
    }
  }
}
