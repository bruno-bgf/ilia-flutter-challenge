import 'package:movie_app/src/domain/domain.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieUseCase movieUseCase;

  MovieCubit({
    required this.movieUseCase,
  }) : super(MovieInitial());

  void init() async {
    emit(MovieLoading());

    final movieList = await movieUseCase.getMovieList();

    emit(MovieLoaded(
      movieList: movieList,
    ));
  }

  void filter(
    List<MovieEntity> movieList,
    String query,
  ) {
    emit(MovieLoading());

    final filteredList = movieUseCase.filterList(movieList, query);

    emit(MovieListChanged(movieList: movieList));

    emit(MovieLoaded(movieList: filteredList));
  }
}
