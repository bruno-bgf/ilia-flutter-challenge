import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/app.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/di/configuration.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await configureDependencies();
  runApp(const App());
}
