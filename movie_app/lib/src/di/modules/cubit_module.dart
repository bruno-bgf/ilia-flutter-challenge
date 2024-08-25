import 'package:injectable/injectable.dart';
import 'package:movie_app/src/domain/domain.dart';
import 'package:movie_app/src/presentation/stores/stores.dart';

@module
abstract class CubitsModule {
  MovieCubit movieCubit(
    MovieUseCase movieUseCase,
  ) =>
      MovieCubit(
        movieUseCase: movieUseCase,
      );
}
