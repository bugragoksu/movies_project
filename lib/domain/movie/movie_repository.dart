import 'package:movie_challenge_project/domain/core/data_result.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/paginated_response.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie.dart';

abstract class MovieRepository {
  Future<DataResult<PaginatedResponse<Movie>>> searchMovies({
    required String query,
    required PaginationParams paginationParams,
  });
}
