class Endpoints {
  Endpoints._();

  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const Duration receiveTimeout = Duration(milliseconds: 30000);
  static const Duration connectionTimeout = Duration(milliseconds: 30000);
  static const String nowPlaying = '/movie/now_playing';
  static const String videos = '/movie/videos';
}
