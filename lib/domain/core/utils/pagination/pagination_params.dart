import 'package:equatable/equatable.dart';

class PaginationParams extends Equatable {
  const PaginationParams(this.pageNumber);

  final int pageNumber;

  @override
  List<Object?> get props => [pageNumber];
}
