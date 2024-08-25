import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/pages/movie_list_page.dart';
import 'package:movie_app/src/themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Hub',
      theme: AppTheme.lightTheme,
      home: const MovieListPage(),
    );
  }
}
