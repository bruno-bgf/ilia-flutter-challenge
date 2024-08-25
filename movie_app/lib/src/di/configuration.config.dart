// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_app/src/data/data.dart' as _i617;
import 'package:movie_app/src/di/modules/cubit_module.dart' as _i844;
import 'package:movie_app/src/di/modules/dio_module.dart' as _i655;
import 'package:movie_app/src/di/modules/remote_data_source_module.dart'
    as _i1042;
import 'package:movie_app/src/di/modules/repository_module.dart' as _i766;
import 'package:movie_app/src/di/modules/use_case_module.dart' as _i458;
import 'package:movie_app/src/domain/domain.dart' as _i8;
import 'package:movie_app/src/presentation/stores/stores.dart' as _i959;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $configureDependencies(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  final remoteDataSourceModule = _$RemoteDataSourceModule();
  final repositoryModule = _$RepositoryModule();
  final useCasesModule = _$UseCasesModule();
  final cubitsModule = _$CubitsModule();
  gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
  gh.lazySingleton<_i617.MovieRemoteDataSource>(
      () => remoteDataSourceModule.movieRepository());
  gh.lazySingleton<_i617.DioClient>(() => dioModule.dioClient(gh<_i361.Dio>()));
  gh.lazySingleton<_i8.MovieRepository>(() =>
      repositoryModule.movieRepository(gh<_i617.MovieRemoteDataSource>()));
  gh.lazySingleton<_i8.MovieUseCase>(
      () => useCasesModule.customerUseCase(gh<_i8.MovieRepository>()));
  gh.factory<_i959.MovieCubit>(
      () => cubitsModule.movieCubit(gh<_i8.MovieUseCase>()));
  return getIt;
}

class _$DioModule extends _i655.DioModule {}

class _$RemoteDataSourceModule extends _i1042.RemoteDataSourceModule {}

class _$RepositoryModule extends _i766.RepositoryModule {}

class _$UseCasesModule extends _i458.UseCasesModule {}

class _$CubitsModule extends _i844.CubitsModule {}
