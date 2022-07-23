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

  Movie get toMovie => Movie(
        backdropPath: backdropPath ?? '',
        id: id,
        genres: genres.map((e) => Genre(id: e.id, name: e.name)).toList(),
        overview: overview,
        title: title,
        voteAverage: voteAverage,
        posterPath: posterPath ?? '',
      );

  static const fromJsonFactory = _$MovieDTOFromJson;
}
