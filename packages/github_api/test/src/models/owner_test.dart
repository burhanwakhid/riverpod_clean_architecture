import 'package:flutter_test/flutter_test.dart';
import 'package:github_api/github_api.dart';

void main() {
  const item = Owner(
    login: 'login',
    id: 2,
    nodeId: 'nodeId',
    avatarUrl: 'avatarUrl',
  );

  group('Owner', () {
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
