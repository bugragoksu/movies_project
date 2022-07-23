// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponseDTO<T> _$PaginatedResponseDTOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedResponseDTO<T>(
      (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      json['page'] as int,
      json['total_pages'] as int,
    );

Map<String, dynamic> _$PaginatedResponseDTOToJson<T>(
  PaginatedResponseDTO<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': instance.results.map(toJsonT).toList(),
      'page': instance.page,
      'total_pages': instance.totalPages,
    };
