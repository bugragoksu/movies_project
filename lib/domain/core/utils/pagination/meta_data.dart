import 'package:equatable/equatable.dart';

class MetaData extends Equatable {
  const MetaData(this.currentPage, this.totalPage);

  final int currentPage;
  final int totalPage;

  @override
  List<Object?> get props => [currentPage, totalPage];
}
