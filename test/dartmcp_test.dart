import 'package:dartmcp/dartmcp.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Client();

    setUp(() {});

    test('First Test', () {
      expect(() => awesome.main(), returnsNormally);
    });
  });
}
