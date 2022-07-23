// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDTO _$MovieDTOFromJson(Map<String, dynamic> json) => MovieDTO(
      adult: json['adult'] as bool,
      backdropPath: json['backdropPath'] as String?,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int,
      originalTitle: json['original_title'] as String,
      originalLanguage: json['original_language'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: DateTime.parse(json['release_date'] as String),
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$MovieDTOToJson(MovieDTO instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'genres': instance.genres,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
