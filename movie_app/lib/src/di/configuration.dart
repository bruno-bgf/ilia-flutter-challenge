import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/di/configuration.config.dart';

GetIt locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configureDependencies() async => $configureDependencies(locator);
