import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/src/models/github_repo.dart';

void main() {
  const githubEntity = GithubRepoEntity(
    ownerName: 'login',
    repoName: 'name',
    description: 'description',
    language: 'lang',
    countStar: 12,
    countFork: 3,
    id: 1,
    avatarUrl: 'avatarUrl',
  );
  group('Github Repo', () {
    test('value comparison', () {
      expect(githubEntity, githubEntity);
    });
    test('props value comparison', () {
      expect(githubEntity.props, githubEntity.props);
    });
    test('copy with value comparison', () {
      expect(githubEntity.copyWith(), githubEntity.copyWith());
    });
  });
}
