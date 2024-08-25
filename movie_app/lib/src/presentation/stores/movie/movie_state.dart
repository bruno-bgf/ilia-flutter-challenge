part of 'movie_cubit.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<MovieEntity> movieList;
  MovieLoaded({
    required this.movieList,
  });
}

class MovieListChanged extends MovieState {
  final List<MovieEntity> movieList;

  MovieListChanged({
    required this.movieList,
  });
}
