import 'dart:async';

import 'package:github_api/github_api.dart';
import 'package:github_repository/src/models/models.dart';

/// {@template github_repository}
/// Github Repository
/// {@endtemplate}
class GithubRepository {
  /// {@macro github_repository}

  GithubRepository({
    required GithubApi githubApi,
    required GithubLocalDataSource githubLocalDataSource,
  })  : _githubApi = githubApi,
        _githubLocalDataSource = githubLocalDataSource;

  final GithubApi _githubApi;
  final GithubLocalDataSource _githubLocalDataSource;

  Future<List<GithubRepoEntity>> getGithubOrgRepo() async {
    try {
      final itemGithub = await _githubApi.getGithubRepo();

      final githubRepoEntity = _convertToEntity(itemGithub);

      // cache github item
      await _githubLocalDataSource.saveGithubRepo(itemGithub);

      return githubRepoEntity;
    } on GithubException {
      final cacheData = await _githubLocalDataSource.getGithubRepo();

      if (cacheData != null) {
        return _convertToEntity(cacheData);
      } else {
        throw Exception();
      }
    }
  }

  List<GithubRepoEntity> _convertToEntity(List<GithubRepo> itemGithub) {
    final githubRepoEntity = <GithubRepoEntity>[];

    for (final element in itemGithub) {
      githubRepoEntity.add(
        GithubRepoEntity(
          id: element.id,
          avatarUrl: element.owner.avatarUrl,
          ownerName: element.owner.login,
          repoName: element.name,
          description: element.description,
          language: element.language ?? '',
          countStar: element.stargazersCount,
          countFork: element.forksCount,
        ),
      );
    }

    return githubRepoEntity;
  }
}
