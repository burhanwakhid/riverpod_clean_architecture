import 'package:flutter_test/flutter_test.dart';
import 'package:github_api/github_api.dart';

void main() {
  const item = License(key: 'key', name: 'name');

  group('License', () {
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
