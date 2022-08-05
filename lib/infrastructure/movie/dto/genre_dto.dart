import 'package:json_annotation/json_annotation.dart';
import 'package:movie_challenge_project/domain/movie/entity/genre.dart';

part 'genre_dto.g.dart';

@JsonSerializable()
class GenreDTO {
  const GenreDTO({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  Genre get toGenre => Genre(id: id, name: name);

  factory GenreDTO.fromJson(Map<String, dynamic> json) => _$GenreDTOFromJson(json);
  static const fromJsonFactory = _$GenreDTOFromJson;
}
