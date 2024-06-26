import 'package:collection/collection.dart';
import 'package:flutter_gen_core/settings/flavored_asset.dart';
import 'package:test/test.dart';

void main() {
  group(FlavoredAsset, () {
    test('constructor', () {
      expect(
        const FlavoredAsset(path: '').toString(),
        'FlavoredAsset(path: , flavors: {})',
      );
      expect(
        const FlavoredAsset(path: 'assets/path'),
        isA<FlavoredAsset>(),
      );
      expect(
        const FlavoredAsset(path: 'assets/path', flavors: {}),
        isA<FlavoredAsset>(),
      );
      expect(
        const FlavoredAsset(path: 'assets/path', flavors: {'test'}),
        isA<FlavoredAsset>(),
      );
      expect(
        const FlavoredAsset(path: '1').copyWith(path: '2'),
        predicate<FlavoredAsset>((e) => e.path == '2'),
      );
      expect(
        const FlavoredAsset(path: '1').copyWith(flavors: {'test'}),
        predicate<FlavoredAsset>(
          (e) => const SetEquality().equals(e.flavors, {'test'}),
        ),
      );
    });
  });
}
