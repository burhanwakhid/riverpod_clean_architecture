import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_api/github_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_storage/secure_storage.dart';

class MockSecureStorage extends Mock implements SecureStorage {}

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

  group('Github Local Data Source', () {
    late SecureStorage secureStorage;
    late GithubLocalDataSource githubLocalDataSource;

    setUp(() {
      secureStorage = MockSecureStorage();

      githubLocalDataSource =
          GithubLocalDataSource(secureStorage: secureStorage);
    });

    test('saveGithubRepo', () {
      when(
        () =>
            secureStorage.write(key: 'dataGithub', value: any(named: 'value')),
      ).thenAnswer((_) => Future.value());

      expect(githubLocalDataSource.saveGithubRepo(github), completes);
    });

    test('get GithubRepo from local data source', () {
      final encoded =
          json.encode(List<dynamic>.from(github.map((x) => x.toJson())));

      when(
        () => secureStorage.read(key: 'dataGithub'),
      ).thenAnswer((_) async => encoded);

      expect(
        githubLocalDataSource.getGithubRepo(),
        completion(equals(github)),
      );
    });
    test(
        'get GithubRepo from local data source '
        'Then return null value', () {
      when(
        () => secureStorage.read(key: 'dataGithub'),
      ).thenAnswer((_) async => null);

      expect(
        githubLocalDataSource.getGithubRepo(),
        completion(equals(null)),
      );
    });
  });
}
