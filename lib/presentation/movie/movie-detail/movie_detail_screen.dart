import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key, required this.movieId}) : super(key: key);
  final String movieId;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars : A New Hope'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500/jBFxXKCrViA88hhO59fDx0Av4P.jpg',
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Image.network('https://critics.io/img/movies/poster-placeholder.png'),
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
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg',
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          _AvarageSection(
                            avarage: '7.3',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _GenresSection()
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.',
                )
              ],
            ),
          )
        ],
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
  }) : super(key: key);

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
        ..._getGenres(
          ['Action', 'Sci-Fi', 'Comedy'],
        )
      ],
    );
  }

  List<Text> _getGenres(List<String> genresList) {
    return genresList.map((e) => Text(e)).toList();
  }
}
