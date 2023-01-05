import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:github_api/github_api.dart';
import 'package:secure_storage/secure_storage.dart';

class GithubLocalDataSource {
  GithubLocalDataSource({
    SecureStorage? secureStorage,
  }) : _secureStorage = secureStorage ?? const SecureStorage();

  final SecureStorage _secureStorage;

  Future<void> saveGithubRepo(List<GithubRepo> data) async {
    final dataEncoded =
        json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    await _secureStorage.write(key: 'dataGithub', value: dataEncoded);
  }

  Future<List<GithubRepo>?> getGithubRepo() async {
    final items = await _secureStorage.read(key: 'dataGithub');

    if (items != null) {
      final result = await compute(
        decodeAndParseGithubRepo,
        items,
      );

      return result;
    } else {
      return null;
    }
  }
}
