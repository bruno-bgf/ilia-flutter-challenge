import 'package:movie_app/src/domain/domain.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    super.id,
    super.title,
    super.overview,
    super.backdropPath,
    super.posterPath,
    super.releaseDate,
    super.voteAverage,
  });
  // const MovieModel({
  //   int? id,
  //   String? title,
  //   String? overview,
  //   String? backdropPath,
  //   String? posterPath,
  //   String? releaseDate,
  //   double? voteAverage,
  // }) : super(
  //         id: id,
  //         title: title,
  //         overview: overview,
  //         backdropPath: backdropPath,
  //         releaseDate: releaseDate,
  //         voteAverage: voteAverage,
  //         posterPath: posterPath,
  //       );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        voteAverage: json['vote_average'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    return data;
  }
}
