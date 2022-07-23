import 'package:injectable/injectable.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/infrastructure/core/dto/paginated_response_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/genre_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_dto.dart';

abstract class MovieDataSource {
  Future<PaginatedResponseDTO<MovieDTO>> searchMovies({
    required String query,
    required PaginationParams paginationParams,
  });
  Future<List<GenreDTO>> getGenres({
    required List<int> genreIds,
  });
}

@Injectable(as: MovieDataSource)
class MovieDataSourceImpl implements MovieDataSource {
  @override
  Future<List<GenreDTO>> getGenres({required List<int> genreIds}) {
    throw UnimplementedError();
  }

  @override
  Future<PaginatedResponseDTO<MovieDTO>> searchMovies(
      {required String query, required PaginationParams paginationParams}) {
    throw UnimplementedError();
  }
}
