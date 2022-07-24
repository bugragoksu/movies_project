import 'dart:math';

import 'package:movie_challenge_project/domain/core/utils/pagination/meta_data.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/infrastructure/core/dto/paginated_response_dto.dart';
import 'package:movie_challenge_project/infrastructure/core/exceptions/response_exception.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/genre_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_dto.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_item_dto.dart';
import 'package:random_string/random_string.dart';

class Any {
  static int integer({int min = 0, int max = 999999}) => min + Random().nextInt(max - min);

  static double float({double min = 0, int max = 100}) => min + (Random().nextDouble() * max);

  static String alphaString(int length) => randomAlpha(length);

  static bool boolean() => Random().nextBool();

  static DateTime dateTime() => DateTime.now().subtract(Duration(days: Random().nextInt(1000)));

  static MovieItemDTO movieItemDTO({
    int? id,
    String? title,
    String? posterPath,
    double? average,
  }) =>
      MovieItemDTO(
        id: id ?? Any.integer(),
        title: title ?? Any.alphaString(15),
        posterPath: posterPath,
        average: average ?? Any.float(),
      );

  static GenreDTO genreDTO({
    int? id,
    String? name,
  }) =>
      GenreDTO(
        id: id ?? Any.integer(),
        name: name ?? Any.alphaString(10),
      );

  static MovieDTO movieDTO({
    bool? adult,
    List<GenreDTO>? genres,
    int? id,
    String? originalTitle,
    String? originalLanguage,
    String? overview,
    double? popularity,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      MovieDTO(
        adult: adult ?? Any.boolean(),
        genres: genres ?? List.generate(3, (index) => Any.genreDTO()),
        id: id ?? Any.integer(),
        originalTitle: originalTitle ?? Any.alphaString(20),
        originalLanguage: originalLanguage ?? Any.alphaString(20),
        overview: overview ?? Any.alphaString(50),
        popularity: popularity ?? Any.float(),
        releaseDate: releaseDate ?? Any.dateTime(),
        title: title ?? Any.alphaString(10),
        video: video ?? Any.boolean(),
        voteAverage: voteAverage ?? Any.float(),
        voteCount: voteCount ?? Any.integer(),
      );

  static PaginatedResponseDTO<T> paginatedResponseDTO<T>({
    required List<T> data,
    MetaData? metaData,
  }) =>
      PaginatedResponseDTO(
        data,
        metaData != null ? metaData.currentPage : Any.integer(),
        metaData != null ? metaData.totalPage : Any.integer(),
      );

  static PaginationParams paginationParams({int? pageNumber, int? pageSize}) => PaginationParams(
        pageNumber ?? Any.integer(),
      );

  static ResponseException responseException() => ResponseException(statusCode: Any.integer(max: 500));
}
