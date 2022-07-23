import 'package:json_annotation/json_annotation.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie_item.dart';

part 'movie_item_dto.g.dart';

@JsonSerializable()
class MovieItemDTO {
  MovieItemDTO({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.average,
  });
  final int id;
  final String title;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'vote_average')
  final double average;

  static MovieItem toMovieItem(MovieItemDTO dto) => MovieItem(
        id: dto.id,
        title: dto.title,
        image: dto.posterPath ?? '',
        average: dto.average,
      );

  factory MovieItemDTO.fromJson(Map<String, dynamic> json) => _$MovieItemDTOFromJson(json);
  static const fromJsonFactory = _$MovieItemDTOFromJson;
}
