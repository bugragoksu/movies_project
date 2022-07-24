import 'dart:math';

import 'package:movie_challenge_project/domain/core/utils/pagination/meta_data.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/infrastructure/core/dto/paginated_response_dto.dart';
import 'package:movie_challenge_project/infrastructure/core/exceptions/response_exception.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/movie_item_dto.dart';
import 'package:random_string/random_string.dart';

class Any {
  static int integer({int min = 0, int max = 999999}) => min + Random().nextInt(max - min);
  static double float({double min = 0, int max = 100}) => min + (Random().nextDouble() * max);
  static String alphaString(int length) => randomAlpha(length);

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

  static PaginatedResponseDTO<T> paginatedResponseDTO<T>({
    required List<T> data,
    MetaData? metaDataDTO,
  }) =>
      PaginatedResponseDTO(
        data,
        metaDataDTO != null ? metaDataDTO.currentPage : Any.integer(),
        metaDataDTO != null ? metaDataDTO.totalPage : Any.integer(),
      );

  static PaginationParams paginationParams({int? pageNumber, int? pageSize}) => PaginationParams(
        pageNumber ?? Any.integer(),
      );

  static ResponseException responseException() => ResponseException(statusCode: Any.integer(max: 500));
}
