import 'package:json_annotation/json_annotation.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie_item.dart';

part 'movie_item_dto.g.dart';

@JsonSerializable()
class MovieItemDTO {
  MovieItemDTO({
    required this.title,
    required this.posterPath,
    required this.avarage,
  });
  final String title;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  final String avarage;

  static MovieItem toMovieItem(MovieItemDTO dto) => MovieItem(
        title: dto.title,
        image: dto.posterPath,
        avarage: dto.avarage,
      );

  static const fromJsonFactory = _$MovieItemDTOFromJson;
}
