import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repository/github_repository.dart';
import 'package:riverpod_app/github_trending/notifier/github_trending_state.dart';

class GithubTrendingNotifier extends StateNotifier<GithubTrendingState> {
  GithubTrendingNotifier({
    required GithubRepository githubRepository,
  })  : _githubRepository = githubRepository,
        super(const GithubTrendingState.initial()) {
    getGithubTrending();
  }

  final GithubRepository _githubRepository;

  Future<void> getGithubTrending() async {
    state = const GithubTrendingState.loading();
    try {
      final githubEntity = await _githubRepository.getGithubOrgRepo();

      state = GithubTrendingState.success(githubRepoEntity: githubEntity);
    } catch (e) {
      state = const GithubTrendingState.failure();
    }
  }

  String _generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }

  int _generateRandomInt(int len) {
    var r = Random();
    return r.nextInt(len);
  }

  void addRandomItemList() {
    final randomItem = GithubRepoEntity(
      ownerName: _generateRandomString(5),
      repoName: _generateRandomString(5),
      description: _generateRandomString(5),
      language: _generateRandomString(5),
      countStar: _generateRandomInt(10),
      countFork: _generateRandomInt(10),
      id: _generateRandomInt(5),
      avatarUrl: state.githubRepoEntity![0].avatarUrl,
    );

    state = state.copyWith(
      githubRepoEntity: [...state.githubRepoEntity!, randomItem],
    );
  }

  void openItemTile(int id) {
    final newItem = state.githubRepoEntity!.map<GithubRepoEntity>((e) {
      if (e.id == id) {
        if (e.isOpen) {
          return e.copyWith(isOpen: false);
        } else {
          return e.copyWith(isOpen: true);
        }
      }
      return e;
    }).toList();

    state = state.copyWith(githubRepoEntity: newItem);
  }

  void sortByStars() {
    final newItem = List<GithubRepoEntity>.generate(
      state.githubRepoEntity!.length,
      (i) => state.githubRepoEntity![i].copyWith(),
    )..sort((a, b) => b.countStar.compareTo(a.countStar));

    state = state.copyWith(githubRepoEntity: newItem);
  }

  void sortByName() {
    final newItem = List<GithubRepoEntity>.generate(
      state.githubRepoEntity!.length,
      (i) => state.githubRepoEntity![i].copyWith(),
    )..sort((a, b) => a.repoName.compareTo(b.repoName));

    state = state.copyWith(githubRepoEntity: newItem);
  }

  void increment() {
    state = state.copyWith(
      value: state.value + 1,
    );
  }
}
