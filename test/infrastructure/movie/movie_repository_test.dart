import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/paginated_response.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie_item.dart';
import 'package:movie_challenge_project/infrastructure/core/dto/paginated_response_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/data-source/movie_data_source.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_item_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/movie_repository_impl.dart';

import '../../helpers/any.dart';
import '../../helpers/fakes.dart';

void main() {
  group(
    'MovieRepository',
    () {
      late final MovieDataSource mockMovieDataSource;
      late final MovieRepositoryImpl movieRepository;
      setUpAll(() {
        mockMovieDataSource = MockMovieDataSource();
        movieRepository = MovieRepositoryImpl(mockMovieDataSource);
      });

      group(
        'searchMovies',
        () {
          late PaginatedResponseDTO<MovieItemDTO> paginatedResponseDTO;
          late List<MovieItemDTO> movieItemDTOList;
          late PaginationParams paginationParams;
          const query = 'Star Wars';

          setUp(
            () {
              movieItemDTOList = List.generate(5, (index) => Any.movieItemDTO());
              paginatedResponseDTO = Any.paginatedResponseDTO(data: movieItemDTOList);
              paginationParams = Any.paginationParams();
            },
          );

          test(
            'should execute correct method from source and return domain data result',
            () async {
              when(
                () => mockMovieDataSource.searchMovies(
                  query: query,
                  paginationParams: paginationParams,
                ),
              ).thenAnswer(
                (_) async => paginatedResponseDTO,
              );

              final res = await movieRepository.searchMovies(
                query: query,
                paginationParams: paginationParams,
              );

              expect(res.data, isA<PaginatedResponse<MovieItem>>());
            },
          );

          test(
            'should return data result failure'
            ' when resource throws exception',
            () async {
              when(
                () => mockMovieDataSource.searchMovies(
                  query: query,
                  paginationParams: paginationParams,
                ),
              ).thenThrow(Any.responseException());

              final res = await movieRepository.searchMovies(
                query: query,
                paginationParams: paginationParams,
              );

              expect(res.isFailure, true);
            },
          );
        },
      );

      group(
        'getMovieDetail',
        () {
          late MovieDTO movieDTO;
          final movieId = Any.integer();

          setUp(() {
            movieDTO = Any.movieDTO();
          });

          test(
            'should execute correct method from source and return domain data result',
            () async {
              when(
                () => mockMovieDataSource.getMovieDetail(movieId: movieId),
              ).thenAnswer(
                (_) async => movieDTO,
              );

              final res = await movieRepository.getMovieDetail(movieId: movieId);

              expect(res.data, isA<Movie>());
              expect(res.data!.id, movieDTO.id);
            },
          );

          test(
            'should return data result failure'
            ' when resource throws exception',
            () async {
              when(
                () => mockMovieDataSource.getMovieDetail(movieId: movieId),
              ).thenThrow(Any.responseException());

              final res = await movieRepository.getMovieDetail(movieId: movieId);

              expect(res.isFailure, true);
            },
          );
        },
      );
    },
  );
}
