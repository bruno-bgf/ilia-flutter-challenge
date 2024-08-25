import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int? id;
  final String? title;
  final String? overview;
  final String? backdropPath;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.posterPath,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        backdropPath,
        posterPath,
        releaseDate,
        voteAverage,
      ];
}
