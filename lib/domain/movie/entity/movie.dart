import 'package:movie_challenge_project/domain/movie/entity/genre.dart';

class Movie {
  Movie({
    required this.backdropPath,
    this.genres,
    required this.id,
    required this.overview,
    required this.title,
    required this.voteAverage,
    required this.posterPath,
  });

  final String backdropPath;
  List<Genre>? genres;
  final int id;
  final String overview;
  final String posterPath;
  final String title;
  final double voteAverage;
}
