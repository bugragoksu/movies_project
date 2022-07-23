// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieItemDTO _$MovieItemDTOFromJson(Map<String, dynamic> json) => MovieItemDTO(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String?,
      average: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieItemDTOToJson(MovieItemDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'vote_average': instance.average,
    };
