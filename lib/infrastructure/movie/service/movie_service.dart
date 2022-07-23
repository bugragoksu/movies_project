import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_challenge_project/infrastructure/core/service/network_service.dart';

abstract class MovieService extends NetworkService {
  MovieService(super.dio);

  Future<Response> searchMovies({required int page, required String query});
  Future<Response> getMovieDetail({required int movieId});
}

@Injectable(as: MovieService)
class MovieServiceImpl extends MovieService {
  MovieServiceImpl(super.dio);

  @override
  Future<Response> searchMovies({required int page, required String query}) {
    return dio.get('search/movie?page=$page&query=$query');
  }

  @override
  Future<Response> getMovieDetail({required int movieId}) {
    return dio.get('movie/$movieId');
  }
}
