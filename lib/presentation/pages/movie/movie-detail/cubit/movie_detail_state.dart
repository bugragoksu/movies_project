part of 'movie_detail_cubit.dart';

enum MovieDetailStatus { initial, success, failure, loading }

class MovieDetailState extends Equatable {
  const MovieDetailState._({
    this.movie,
    this.status = MovieDetailStatus.initial,
    this.errorMessage,
  });

  const MovieDetailState.initial() : this._();

  final Movie? movie;
  final MovieDetailStatus status;
  final String? errorMessage;

  MovieDetailState copyWith({
    Movie? movie,
    MovieDetailStatus? status,
    String? errorMessage,
  }) =>
      MovieDetailState._(
        movie: movie ?? this.movie,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        movie,
        status,
        errorMessage,
      ];
}
