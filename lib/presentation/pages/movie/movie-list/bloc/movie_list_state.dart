part of 'movie_list_cubit.dart';

enum MovieListStatus { initial, success, failure, loading }

class MovieListState extends Equatable {
  const MovieListState._({
    this.movies = const [],
    this.status = MovieListStatus.initial,
    this.metaData,
  });

  const MovieListState.initial() : this._();

  final List<MovieItem> movies;
  final MovieListStatus status;
  final MetaData? metaData;

  MovieListState copyWith({
    List<MovieItem>? movies,
    MovieListStatus? status,
    MetaData? metaData,
  }) =>
      MovieListState._(
        movies: movies ?? this.movies,
        status: status ?? this.status,
        metaData: metaData ?? this.metaData,
      );

  @override
  List<Object?> get props => [
        movies,
        status,
        metaData,
      ];
}
