import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:github_api/github_api.dart';
import 'package:github_api/src/constant/constant.dart';

class GithubException implements Exception {
  /// {@macro organization_repository_exception}
  const GithubException(this.error, this.stackTrace);

  /// The [Exception] which was thrown.
  final Exception error;

  /// The full [StackTrace].
  final StackTrace? stackTrace;
}

/// {@template github_api}
/// Github Api
/// {@endtemplate}
class GithubApi {
  /// {@macro github_api}

  GithubApi({
    Dio? dio,
  }) : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: ConstantApi.baseUrl,
                headers: {
                  HttpHeaders.acceptHeader: ConstantApi.acceptHeader,
                  HttpHeaders.authorizationHeader: ConstantApi.authHeader,
                  'X-GitHub-Api-Version': ConstantApi.xGithubApiVersion,
                },
              ),
            );
  final Dio _dio;

  Future<List<GithubRepo>> getGithubRepo() async {
    try {
      final response = await _dio.get<String>('/orgs/octokit/repos');

      final result = await compute(
        decodeAndParseGithubRepo,
        response.data!,
      );

      return result;
    } on DioError catch (e) {
      throw GithubException(Exception('sdfdsa'), e.stackTrace);
    }
  }
}

List<GithubRepo> decodeAndParseGithubRepo(String encodedJson) {
  final data = jsonDecode(encodedJson) as List<dynamic>;

  final result = List<GithubRepo>.from(
    data.map((e) => GithubRepo.fromJson(e as Map<String, dynamic>)),
  );

  return result;
}
