import 'package:equatable/equatable.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/meta_data.dart';

class PaginatedResponse<T> extends Equatable {
  const PaginatedResponse(this.data, this.metadata);

  final List<T> data;
  final MetaData metadata;

  @override
  List<Object?> get props => [data, metadata];
}
