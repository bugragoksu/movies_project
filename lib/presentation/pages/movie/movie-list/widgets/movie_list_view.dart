import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_challenge_project/domain/movie/entity/movie_item.dart';
import 'package:movie_challenge_project/presentation/pages/movie/movie-detail/movie_detail_screen.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    Key? key,
    required this.scrollController,
    required this.movies,
  }) : super(key: key);

  final ScrollController scrollController;
  final List<MovieItem> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 10,
        ),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) => _MovieCard(
          imageUrl: movies[index].image,
          score: movies[index].average.toString(),
          title: movies[index].title,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => const MovieDetailScreen(movieId: '1')),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  const _MovieCard({
    Key? key,
    required this.imageUrl,
    required this.score,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final String imageUrl;
  final String score;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl:
                  imageUrl.isNotEmpty ? 'https://image.tmdb.org/t/p/w500$imageUrl' : 'https://via.placeholder.com/500',
              errorWidget: (context, url, error) => const Placeholder(),
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              bottom: 0,
              left: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        score,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
