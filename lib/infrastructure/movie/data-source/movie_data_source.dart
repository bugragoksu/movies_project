import 'package:injectable/injectable.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/infrastructure/core/dto/paginated_response_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/genre_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_item_dto.dart';

abstract class MovieDataSource {
  Future<PaginatedResponseDTO<MovieItemDTO>> searchMovies({
    required String query,
    required PaginationParams paginationParams,
  });
  Future<List<GenreDTO>> getGenres();

  Future<MovieDTO> getMovieDetail({required int movieId});
}

@Injectable(as: MovieDataSource)
class MovieDataSourceImpl implements MovieDataSource {
  @override
  Future<List<GenreDTO>> getGenres() {
    throw UnimplementedError();
  }

  @override
  Future<PaginatedResponseDTO<MovieItemDTO>> searchMovies(
      {required String query, required PaginationParams paginationParams}) {
    throw UnimplementedError();
  }

  @override
  Future<MovieDTO> getMovieDetail({required int movieId}) {
    throw UnimplementedError();
  }
}
