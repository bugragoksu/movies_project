import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/meta_data.dart';
import 'package:movie_challenge_project/domain/core/utils/pagination/pagination_params.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie_item.dart';
import 'package:movie_challenge_project/domain/movie/movie_repository.dart';

part 'movie_list_state.dart';

@injectable
class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit(this._movieRepository) : super(const MovieListState.initial());

  final MovieRepository _movieRepository;

  Future<void> searchMovie({required String query}) async {
    emit(state.copyWith(status: MovieListStatus.loading));
    final result = await _movieRepository.searchMovies(query: query, paginationParams: const PaginationParams(1));
    result.fold(
      (error) => emit(
        state.copyWith(
          status: MovieListStatus.failure,
          errorMessage: error.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: MovieListStatus.success,
          movies: data.data,
          metaData: data.metadata,
        ),
      ),
    );
  }

  Future<void> searchMovieMore({required String query}) async {
    final paginationParams = PaginationParams(state.metaData!.currentPage + 1);
    final response = await _movieRepository.searchMovies(query: query, paginationParams: paginationParams);

    response.fold(
      (error) {
        emit(state.copyWith(
          status: MovieListStatus.failure,
          errorMessage: error.message,
        ));
      },
      (data) => emit(
        state.copyWith(
          status: MovieListStatus.success,
          movies: [...state.movies, ...data.data],
          metaData: data.metadata,
        ),
      ),
    );
  }
}
