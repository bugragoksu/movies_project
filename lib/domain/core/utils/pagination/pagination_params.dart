import 'package:equatable/equatable.dart';

class PaginationParams extends Equatable {
  const PaginationParams(
    this.pageNumber, {
    this.pageSize = 16,
  });

  final int pageNumber;
  final int pageSize;

  @override
  List<Object?> get props => [pageNumber, pageSize];
}
