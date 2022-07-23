import 'package:json_annotation/json_annotation.dart';
import 'package:movie_challenge_project/domain/movie/entity/genre.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie.dart';
import 'package:movie_challenge_project/infrastructure/movie/dto/genre_dto.dart';

part 'movie_dto.g.dart';

@JsonSerializable()
class MovieDTO {
  const MovieDTO({
    required this.adult,
    this.backdropPath,
    required this.genres,
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
  final List<GenreDTO> genres;
  final int id;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  final String overview;
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final DateTime releaseDate;
  final String title;
  final bool video;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;

  Movie get toMovie => Movie(
        backdropPath: backdropPath ?? '',
        id: id,
        genres: genres.map((e) => Genre(id: e.id, name: e.name)).toList(),
        overview: overview,
        title: title,
        voteAverage: voteAverage,
        posterPath: posterPath ?? '',
      );

  factory MovieDTO.fromJson(Map<String, dynamic> json) => _$MovieDTOFromJson(json);
  static const fromJsonFactory = _$MovieDTOFromJson;
}
