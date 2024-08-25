import 'package:injectable/injectable.dart';
import 'package:movie_app/src/domain/domain.dart';

@module
abstract class UseCasesModule {
  @lazySingleton
  MovieUseCase customerUseCase(
    MovieRepository movieRepository,
  ) =>
      MovieUseCase(
        movieRepository: movieRepository,
      );
}
