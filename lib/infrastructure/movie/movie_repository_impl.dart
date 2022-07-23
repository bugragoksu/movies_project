import 'package:injectable/injectable.dart';
import 'package:movie_challenge_project/domain/core/failures/failure.dart';
import 'package:movie_challenge_project/domain/movie/entity/genre.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/paginated_response.dart';
import 'package:movie_challenge_project/domain/core/data_result.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie_item.dart';
import 'package:movie_challenge_project/domain/movie/movie_repository.dart';
import 'package:movie_challenge_project/infrastructure/movie/data-source/movie_data_source.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_item_dto.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<DataResult<PaginatedResponse<MovieItem>>> searchMovies(
      {required String query, required PaginationParams paginationParams}) async {
    try {
      final result = await _movieDataSource.searchMovies(query: query, paginationParams: paginationParams);
      final paginatedResponse = result.toPaginatedResponse<MovieItem>(MovieItemDTO.toMovieItem);
      return DataResult.success(paginatedResponse);
    } on Exception catch (e) {
      return DataResult.failure(Failure.fromException(e));
    }
  }

  @override
  Future<DataResult<List<Genre>>> getGenres() async {
    try {
      final result = await _movieDataSource.getGenres();
      return DataResult.success(result.map((e) => e.toGenre).toList());
    } on Exception catch (e) {
      return DataResult.failure(Failure.fromException(e));
    }
  }

  @override
  Future<DataResult<Movie>> getMovieDetail({required int movieId}) async {
    try {
      final result = await _movieDataSource.getMovieDetail(movieId: movieId);
      return DataResult.success(result.toMovie);
    } on Exception catch (e) {
      return DataResult.failure(Failure.fromException(e));
    }
  }
}
