// ignore_for_file: inference_failure_on_function_invocation

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_api/github_api.dart';
import 'package:github_api/src/constant/constant.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('Github API', () {
    late Dio dio;
    late GithubApi githubApi;
    late DioAdapter dioAdapter;

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: ConstantApi.baseUrl));
      dioAdapter = DioAdapter(dio: dio);

      dio.httpClientAdapter = dioAdapter;

      githubApi = GithubApi(dio: dioAdapter.dio);
    });

    test('constructor returns normally', () {
      expect(
        GithubApi.new,
        returnsNormally,
      );
    });

    group('Get Github repo ', () {
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
          license: License(key: 'key', name: 'name'),
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
      final encoded =
          json.encode(List<dynamic>.from(github.map((x) => x.toJson())));
      test('Get github success', () async {
        dioAdapter.onGet('/orgs/octokit/repos', (server) {
          return server.reply(200, jsonDecode(encoded));
        });

        expect(
          githubApi.getGithubRepo(),
          completion(equals(github)),
        );
      });
      test('Get github failure', () async {
        dioAdapter.onGet('/orgs/octokit/repos', (server) {
          return server.reply(400, jsonDecode(encoded));
        });

        expect(
          githubApi.getGithubRepo(),
          throwsA(isA<GithubException>()),
        );
      });
    });
  });
}
