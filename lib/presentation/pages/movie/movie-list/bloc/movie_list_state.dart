part of 'movie_list_cubit.dart';

enum MovieListStatus { initial, success, failure, loading }

class MovieListState extends Equatable {
  const MovieListState._({
    this.movies = const [],
    this.status = MovieListStatus.initial,
    this.metaData,
    this.errorMessage,
  });

  const MovieListState.initial() : this._();

  final List<MovieItem> movies;
  final MovieListStatus status;
  final MetaData? metaData;
  final String? errorMessage;

  MovieListState copyWith({
    List<MovieItem>? movies,
    MovieListStatus? status,
    MetaData? metaData,
    String? errorMessage,
  }) =>
      MovieListState._(
        movies: movies ?? this.movies,
        status: status ?? this.status,
        metaData: metaData ?? this.metaData,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        movies,
        status,
        metaData,
        errorMessage,
      ];
}
