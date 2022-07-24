import 'dart:math';

import 'package:dio/dio.dart';
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

  static MetaData metaData({
    int? currentPage,
    int? totalPage,
  }) =>
      MetaData(
        currentPage ?? Any.integer(),
        totalPage ?? Any.integer(),
      );

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

  static ResponseException responseException() => ResponseException(statusCode: Any.integer(min: 400, max: 500));

  static Response<Map<String, dynamic>> successResponseWithBody(Map<String, dynamic>? body) =>
      Response<Map<String, dynamic>>(
        statusCode: 200,
        data: body,
        requestOptions: RequestOptions(
          path: Any.alphaString(10),
        ),
      );

  static Response<T> errorResponse<T>({T? body, String? errorMessage}) => Response(
        statusCode: 500,
        data: body,
        statusMessage: errorMessage ?? Any.alphaString(10),
        requestOptions: RequestOptions(
          path: Any.alphaString(10),
        ),
      );
  static Map<String, dynamic> get searchMovieResultJson => {
        "page": 1,
        "results": [
          {
            "adult": false,
            "backdrop_path": "/5Iw7zQTHVRBOYpA0V6z0yypOPZh.jpg",
            "genre_ids": [12, 28, 878],
            "id": 181808,
            "original_language": "en",
            "original_title": "Star Wars: The Last Jedi",
            "overview":
                "Rey develops her newly discovered abilities with the guidance of Luke Skywalker, who is unsettled by the strength of her powers. Meanwhile, the Resistance prepares to do battle with the First Order.",
            "popularity": 78.994,
            "poster_path": "/ySaaKHOLAQU5HoZqWmzDIj1VvZ1.jpg",
            "release_date": "2017-12-13",
            "title": "Star Wars: The Last Jedi",
            "video": false,
            "vote_average": 6.9,
            "vote_count": 13185
          },
          {
            "adult": false,
            "backdrop_path": null,
            "genre_ids": [],
            "id": 693441,
            "original_language": "en",
            "original_title": "The Last Jedi: Meet the Porgs",
            "overview":
                "This piece explores Porg origins and inspiration, design, transition from sketches to final physical puppet, puppet control, sound effects, and digital support features.",
            "popularity": 0.6,
            "poster_path": null,
            "release_date": "2018-03-27",
            "title": "The Last Jedi: Meet the Porgs",
            "video": true,
            "vote_average": 0,
            "vote_count": 0
          },
          {
            "adult": false,
            "backdrop_path": null,
            "genre_ids": [878, 35],
            "id": 441823,
            "original_language": "en",
            "original_title": "Star Worlds Episode XXXIVE=MC2: The Force Awakens The Last Jedi Who Went Rogue",
            "overview":
                "A Star Wars parody film by the filmmakers behind Scary Movie, Epic Movie, Meet the Spartans and Vampires Suck.",
            "popularity": 1.204,
            "poster_path": null,
            "release_date": "",
            "title": "Star Worlds Episode XXXIVE=MC2: The Force Awakens The Last Jedi Who Went Rogue",
            "video": false,
            "vote_average": 0,
            "vote_count": 0
          }
        ],
        "total_pages": 1,
        "total_results": 3
      };
}
