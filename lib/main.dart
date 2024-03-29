import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_challenge_project/injection.dart';
import 'package:movie_challenge_project/presentation/core/theme/app_theme.dart';
import 'package:movie_challenge_project/presentation/pages/movie/movie-list/movie_list_screen.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: 'Movie Challenge Project',
      theme: AppTheme.instance.theme,
      home: const MovieListScreen(),
    );
  }
}
