import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_challenge_project/domain/movie/entity/genre.dart';
import 'package:movie_challenge_project/injection.dart';
import 'package:movie_challenge_project/presentation/pages/movie/movie-detail/cubit/movie_detail_cubit.dart';
import 'package:movie_challenge_project/presentation/pages/movie/widgets/error_text_button.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late final MovieDetailCubit _movieDetailCubit;
  @override
  void initState() {
    super.initState();
    _movieDetailCubit = getIt.get<MovieDetailCubit>()..getMovieDetail(id: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _movieDetailCubit,
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<MovieDetailCubit, MovieDetailState>(
            builder: (context, state) {
              return Text(
                _movieDetailCubit.state.movie != null ? _movieDetailCubit.state.movie!.title : 'Movie Detail',
              );
            },
          ),
        ),
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state.status == MovieDetailStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == MovieDetailStatus.failure) {
              return Center(
                child: ErrorTextButton(
                  errorMessage: state.errorMessage,
                  onRetry: () {
                    _movieDetailCubit.getMovieDetail(id: widget.movieId);
                  },
                ),
              );
            } else if (state.status == MovieDetailStatus.success) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: state.movie!.backdropPath.isNotEmpty
                        ? 'https://image.tmdb.org/t/p/w500/${state.movie!.backdropPath}'
                        : 'https://critics.io/img/movies/poster-placeholder.png',
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Placeholder(),
                    color: Colors.white.withOpacity(0.5),
                    colorBlendMode: BlendMode.modulate,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CachedNetworkImage(
                                imageUrl: state.movie!.posterPath.isNotEmpty
                                    ? 'https://image.tmdb.org/t/p/w500/${state.movie!.posterPath}'
                                    : 'https://via.placeholder.com/500',
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) => Image.network('https://via.placeholder.com/500'),
                                colorBlendMode: BlendMode.modulate,
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _AvarageSection(
                                    avarage: state.movie!.voteAverage.toString(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  _GenresSection(
                                    genres: state.movie!.genres,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(state.movie!.overview)
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class _AvarageSection extends StatelessWidget {
  const _AvarageSection({
    Key? key,
    required this.avarage,
  }) : super(key: key);
  final String avarage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Avarage :',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(avarage)
      ],
    );
  }
}

class _GenresSection extends StatelessWidget {
  const _GenresSection({
    Key? key,
    required this.genres,
  }) : super(key: key);
  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Text(
          'Genres :',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ..._getGenres,
      ],
    );
  }

  List<Text> get _getGenres {
    return genres.map((e) => Text(e.name)).toList();
  }
}
