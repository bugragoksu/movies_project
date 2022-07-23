import 'package:json_annotation/json_annotation.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/meta_data.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/paginated_response.dart';

part 'paginated_response_dto.g.dart';

typedef ToGenericDomain<V, T> = V Function(T o);

@JsonSerializable(genericArgumentFactories: true)
class PaginatedResponseDTO<T> {
  PaginatedResponseDTO(this.results, this.page, this.totalPages);

  final List<T> results;
  final int page;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  PaginatedResponse<V> toPaginatedResponse<V>(ToGenericDomain<V, T> toGenericDomain) {
    return PaginatedResponse<V>(
      results.map(toGenericDomain).toList(),
      MetaData(page, totalPages),
    );
  }

  static const fromJsonFactory = _$PaginatedResponseDTOFromJson;
}
