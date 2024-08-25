import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/src/data/data.dart';
import 'package:movie_app/src/di/configuration.dart';

abstract class IMovieRemoteDataSource {
  Future<List<MovieModel>> getMovieList();
}

class MovieRemoteDataSource implements IMovieRemoteDataSource {
  final DioClient dioClient = locator.get<DioClient>();

  @override
  Future<List<MovieModel>> getMovieList() async {
    final apiKey = dotenv.env['apiKey'] ?? '';

    final query = await dioClient.get(
      Endpoints.nowPlaying,
      queryParameters: {
        'api_key': apiKey,
      },
    );

    final jsonData = query.data["results"] as List;

    final list = jsonData
        .map(
          (movie) => MovieModel.fromJson(movie),
        )
        .toList();

    return list;
  }
}
