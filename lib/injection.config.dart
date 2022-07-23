// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/movie/movie_repository.dart' as _i6;
import 'infrastructure/core/service/network_service.dart' as _i9;
import 'infrastructure/movie/data-source/movie_data_source.dart' as _i5;
import 'infrastructure/movie/movie_repository_impl.dart' as _i7;
import 'infrastructure/movie/service/movie_service.dart' as _i4;
import 'presentation/pages/movie/movie-list/bloc/movie_list_cubit.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  gh.factory<_i3.Dio>(() => dioModule.dio);
  gh.factory<_i4.MovieService>(() => _i4.MovieServiceImpl(get<_i3.Dio>()));
  gh.factory<_i5.MovieDataSource>(
      () => _i5.MovieDataSourceImpl(get<_i4.MovieService>()));
  gh.factory<_i6.MovieRepository>(
      () => _i7.MovieRepositoryImpl(get<_i5.MovieDataSource>()));
  gh.factory<_i8.MovieListCubit>(
      () => _i8.MovieListCubit(get<_i6.MovieRepository>()));
  return get;
}

class _$DioModule extends _i9.DioModule {}
