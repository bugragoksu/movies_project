import 'package:injectable/injectable.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/infrastructure/core/dto/paginated_response_dto.dart';
import 'package:movie_challenge_project/infrastructure/core/exceptions/response_exception.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_item_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/service/movie_service.dart';

abstract class MovieDataSource {
  Future<PaginatedResponseDTO<MovieItemDTO>> searchMovies({
    required String query,
    required PaginationParams paginationParams,
  });

  Future<MovieDTO> getMovieDetail({required int movieId});
}

@Injectable(as: MovieDataSource)
class MovieDataSourceImpl implements MovieDataSource {
  final MovieService _movieService;

  MovieDataSourceImpl(this._movieService);
  @override
  Future<PaginatedResponseDTO<MovieItemDTO>> searchMovies(
      {required String query, required PaginationParams paginationParams}) async {
    final result = await _movieService.searchMovies(page: paginationParams.pageNumber, query: query);
    if (result.statusCode == 200) {
      return PaginatedResponseDTO<MovieItemDTO>(
        (result.data['results'] as List<dynamic>).map((e) => MovieItemDTO.fromJson(e)).toList(),
        result.data['page'],
        result.data['total_pages'],
      );
    }
    throw ResponseException(
      statusCode: result.statusCode ?? 500,
      message: result.statusMessage,
    );
  }

  @override
  Future<MovieDTO> getMovieDetail({required int movieId}) async {
    final result = await _movieService.getMovieDetail(movieId: movieId);
    if (result.statusCode == 200) {
      return MovieDTO.fromJson(result.data);
    }
    throw ResponseException(
      statusCode: result.statusCode ?? 500,
      message: result.statusMessage,
    );
  }
}
