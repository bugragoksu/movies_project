// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieItemDTO _$MovieItemDTOFromJson(Map<String, dynamic> json) => MovieItemDTO(
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      avarage: json['avarage'] as String,
    );

Map<String, dynamic> _$MovieItemDTOToJson(MovieItemDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'poster_path': instance.posterPath,
      'avarage': instance.avarage,
    };
