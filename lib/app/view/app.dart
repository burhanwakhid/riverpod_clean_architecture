import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repository/github_repository.dart';
import 'package:riverpod_app/home/home.dart';

final githubApiProvider = GithubApi();

final githubLocalDataSourceProvider = GithubLocalDataSource();

final githubRepositoryProvider = Provider<GithubRepository>((ref) {
  return GithubRepository(
    githubApi: githubApiProvider,
    githubLocalDataSource: githubLocalDataSourceProvider,
  );
});

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
