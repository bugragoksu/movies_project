import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  label: Text('Search'),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 12,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 4,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) => const _MovieCard(
                    imageUrl: 'https://via.placeholder.com/500',
                    score: '7.3',
                    title: 'Star Wars : A New Hope',
                  ),
                ),
              ),
            ],
          ),
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
  }) : super(key: key);

  final String imageUrl;
  final String score;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            errorWidget: (context, url, error) => const Placeholder(),
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      score,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.white10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
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
    );
  }
}
