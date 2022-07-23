import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_challenge_project/injection.dart';
import 'package:movie_challenge_project/presentation/common/mixin/pagination_list.dart';
import 'package:movie_challenge_project/presentation/pages/movie/movie-list/bloc/movie_list_cubit.dart';
import 'package:movie_challenge_project/presentation/pages/movie/movie-list/widgets/movie_list_view.dart';
import 'package:movie_challenge_project/presentation/pages/movie/widgets/error_text_button.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> with PaginationList {
  late final MovieListCubit _movieListCubit;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _movieListCubit = getIt.get<MovieListCubit>();
    onLoadMore = _onScroll;
    addScrollListener();
    _searchController.addListener(() {
      final query = _searchController.text;
      if (query.length >= 3) {
        _movieListCubit.searchMovie(query: query);
      }
    });
  }

  @override
  void dispose() {
    paginationDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                label: Text('Search'),
              ),
            ),
            const Spacer(),
            BlocProvider.value(
              value: _movieListCubit,
              child: BlocBuilder<MovieListCubit, MovieListState>(
                builder: (context, state) {
                  if (state.status == MovieListStatus.initial) {
                    return const Expanded(
                      child: Text('Please enter a text'),
                    );
                  } else if (state.status == MovieListStatus.loading) {
                    return Expanded(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Spacer(),
                        ],
                      ),
                    );
                  } else if (state.status == MovieListStatus.success) {
                    if (state.movies.isEmpty) {
                      return const Expanded(
                        child: Text("Couln't found any movie"),
                      );
                    }
                    return MovieListView(
                      scrollController: scrollController,
                      movies: state.movies,
                    );
                  } else if (state.status == MovieListStatus.failure) {
                    return Expanded(
                      child: ErrorTextButton(
                        errorMessage: state.errorMessage,
                        onRetry: () {
                          _movieListCubit.searchMovie(query: _searchController.text);
                        },
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onScroll() async {
    final metaData = _movieListCubit.state.metaData;
    if (metaData != null && metaData.currentPage < metaData.totalPage) {
      setState(() => isLoadingMore = true);
      await _movieListCubit.searchMovieMore(query: _searchController.text);
      setState(() => isLoadingMore = false);
    }
  }
}
