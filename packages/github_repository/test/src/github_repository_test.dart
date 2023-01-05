import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockGithubApi extends Mock implements GithubApi {}

class MockGithubLocalDataSource extends Mock implements GithubLocalDataSource {}

void main() {
  final github = [
    const GithubRepo(
      id: 1,
      name: 'name',
      fullName: 'fullName',
      private: false,
      owner: Owner(
        login: 'login',
        id: 2,
        nodeId: 'nodeId',
        avatarUrl: 'avatarUrl',
      ),
      htmlUrl: 'htmlUrl',
      description: 'description',
      fork: false,
      size: 2,
      stargazersCount: 12,
      watchersCount: 321,
      forksCount: 3,
      visibility: 'visibility',
      forks: 2,
      openIssues: 2,
      watchers: 2,
      language: 'lang',
      defaultBranch: 'defaultBranch',
      permissions: Permissions(
        admin: false,
        maintain: false,
        push: false,
        triage: false,
        pull: false,
      ),
    ),
  ];

  final githubEntity = [
    const GithubRepoEntity(
      ownerName: 'login',
      repoName: 'name',
      description: 'description',
      language: 'lang',
      countStar: 12,
      countFork: 3,
      id: 1,
      avatarUrl: 'avatarUrl',
    ),
  ];
  group('Github Repository', () {
    late GithubApi githubApi;
    late GithubLocalDataSource githubLocalDataSource;
    late GithubRepository githubRepository;

    setUp(() {
      githubApi = MockGithubApi();
      githubLocalDataSource = MockGithubLocalDataSource();

      githubRepository = GithubRepository(
        githubApi: githubApi,
        githubLocalDataSource: githubLocalDataSource,
      );

      when(
        () => githubApi.getGithubRepo(),
      ).thenAnswer((_) async => github);

      when(
        () => githubLocalDataSource.getGithubRepo(),
      ).thenAnswer((_) async => github);

      when(
        () => githubLocalDataSource.saveGithubRepo(any()),
      ).thenAnswer((_) => Future.value());
    });
    test('get github success', () {
      expect(
        githubRepository.getGithubOrgRepo(),
        completion(equals(githubEntity)),
      );
    });
    test(
        'get github failed '
        'Then get data from local database', () {
      when(
        () => githubApi.getGithubRepo(),
      ).thenThrow(GithubException(Exception('e'), StackTrace.current));

      expect(
        githubRepository.getGithubOrgRepo(),
        completion(equals(githubEntity)),
      );
    });

    test(
        'get github failed '
        'Then get data from local database failed Then throw Exception', () {
      when(
        () => githubApi.getGithubRepo(),
      ).thenThrow(GithubException(Exception('e'), StackTrace.current));

      when(
        () => githubLocalDataSource.getGithubRepo(),
      ).thenAnswer((_) async => null);

      expect(
        githubRepository.getGithubOrgRepo(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
