import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie.dart';
import 'package:movie_challenge_project/domain/movie/movie_repository.dart';

part 'movie_detail_state.dart';

@injectable
class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(this._movieRepository) : super(const MovieDetailState.initial());

  final MovieRepository _movieRepository;

  Future<void> getMovieDetail({required int id}) async {
    emit(state.copyWith(status: MovieDetailStatus.loading));
    final result = await _movieRepository.getMovieDetail(movieId: id);
    result.fold(
      (error) => state.copyWith(
        status: MovieDetailStatus.failure,
        errorMessage: error.message,
      ),
      (data) => emit(
        state.copyWith(status: MovieDetailStatus.success, movie: data),
      ),
    );
  }
}
