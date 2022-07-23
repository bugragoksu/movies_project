import 'package:json_annotation/json_annotation.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDTO {
  const MovieDTO({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  static Movie toMovie(MovieDTO dto) => Movie(
        backdropPath: dto.backdropPath ?? '',
        id: dto.id,
        genres: dto.genreIds,
        overview: dto.overview,
        title: dto.title,
        voteAverage: dto.voteAverage,
        posterPath: dto.posterPath ?? '',
      );

  static const fromJsonFactory = _$MovieDTOFromJson;
}
