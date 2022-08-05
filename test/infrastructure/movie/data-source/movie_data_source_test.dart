import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/infrastructure/core/exceptions/response_exception.dart';
import 'package:movie_challenge_project/infrastructure/movie/data-source/movie_data_source.dart';
import 'package:movie_challenge_project/infrastructure/movie/service/movie_service.dart';

import '../../../helpers/any.dart';
import '../../../helpers/fakes.dart';

void main() {
  group('MovieDataSource', () {
    late MovieService mockMovieService;
    late MovieDataSourceImpl movieDataSource;
    late PaginationParams paginationParams;
    const currentPage = 1;

    setUp(() {
      mockMovieService = MockMovieService();
      movieDataSource = MovieDataSourceImpl(mockMovieService);
      paginationParams = Any.paginationParams(pageNumber: currentPage);
    });

    group('searchMovies', () {
      late Map<String, dynamic> resultJson;

      const query = 'Star Wars';

      setUp(() {
        resultJson = Any.searchMovieResultJson;
      });

      test('should execute correct service method and return paginated response', () async {
        when(
          () => mockMovieService.searchMovies(query: query, page: currentPage),
        ).thenAnswer((_) async => Any.successResponseWithBody(resultJson));

        final response = await movieDataSource.searchMovies(
          query: query,
          paginationParams: paginationParams,
        );

        expect(response.page, currentPage);
        expect(response.results.length, 3);
      });

      test('should call service method with correct params', () async {
        when(
          () => mockMovieService.searchMovies(
            page: currentPage,
            query: query,
          ),
        ).thenAnswer((_) async => Any.successResponseWithBody(resultJson));

        await movieDataSource.searchMovies(query: query, paginationParams: paginationParams);

        verify(
          () => mockMovieService.searchMovies(
            page: currentPage,
            query: query,
          ),
        ).called(1);
      });

      test(
          'should throw response exception'
          ' when response is error', () async {
        when(
          () => mockMovieService.searchMovies(
            query: query,
            page: currentPage,
          ),
        ).thenAnswer((_) async => Any.errorResponse());

        expect(
          () => movieDataSource.searchMovies(
            query: query,
            paginationParams: paginationParams,
          ),
          throwsA(isA<ResponseException>()),
        );
      });
    });
  });
}
