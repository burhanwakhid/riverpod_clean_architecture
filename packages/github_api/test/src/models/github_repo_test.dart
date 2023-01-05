import 'package:flutter_test/flutter_test.dart';
import 'package:github_api/github_api.dart';

void main() {
  const item = GithubRepo(
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
    license: License(key: 'key', name: 'name'),
    permissions: Permissions(
      admin: false,
      maintain: false,
      push: false,
      triage: false,
      pull: false,
    ),
  );

  group('Github Repo', () {
    test('value comparison', () {
      expect(item, item);
    });
    test('props value comparison', () {
      expect(item.props, item.props);
    });
    test('copy with value comparison', () {
      expect(item.copyWith(), item.copyWith());
    });
  });
}
