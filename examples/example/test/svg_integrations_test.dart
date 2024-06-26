import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

class SvgIntegrationsTest extends StatelessWidget {
  const SvgIntegrationsTest({required this.theme});

  final SvgTheme theme;

  @override
  Widget build(BuildContext context) {
    return DefaultSvgTheme(
      theme: theme,
      child: MyAssets.images.icons.dartTest.svg(),
    );
  }
}

void main() {
  group('Test SvgTheme behavior', () {
    final testTheme = const SvgTheme(currentColor: Colors.red);

    testWidgets('Passed theme should be null', (widgetTester) async {
      await widgetTester.pumpWidget(SvgIntegrationsTest(theme: testTheme));

      final finder = find.byType(SvgPicture);
      expect(finder, findsOneWidget);

      final svgWidget = widgetTester.widget<SvgPicture>(finder);
      final loader = svgWidget.bytesLoader as SvgAssetLoader;

      expect(loader.theme, isNull);
    });

    testWidgets(
        'Taken theme of SvgAssetLoader equals with one passed to parent DefaultSvgTheme',
        (widgetTester) async {
      await widgetTester.pumpWidget(SvgIntegrationsTest(theme: testTheme));

      final finder = find.byType(SvgPicture);
      expect(finder, findsOneWidget);

      final svgWidget = widgetTester.widget<SvgPicture>(finder);
      final loader = svgWidget.bytesLoader as SvgAssetLoader;

      final svgCacheKey = loader.cacheKey(widgetTester.element(finder));

      expect(svgCacheKey.theme, testTheme);
    });
  });
}
