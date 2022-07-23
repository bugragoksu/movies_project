import 'package:movie_challenge_project/domain/core/data_result.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/paginated_response.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/domain/movie/entity/genre.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie_item.dart';

abstract class MovieRepository {
  Future<DataResult<PaginatedResponse<MovieItem>>> searchMovies({
    required String query,
    required PaginationParams paginationParams,
  });

  Future<DataResult<List<Genre>>> getGenres();

  Future<DataResult<Movie>> getMovieDetail({required int movieId});
}
