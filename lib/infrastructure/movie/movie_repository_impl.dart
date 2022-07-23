import 'package:injectable/injectable.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/paginated_response.dart';
import 'package:movie_challenge_project/domain/core/data_result.dart';
import 'package:movie_challenge_project/domain/movie/movie_repository.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<DataResult<PaginatedResponse<List<Movie>>>> searchMovies(
      {required String query, required PaginationParams paginationParams}) {
    throw UnimplementedError();
  }
}
