import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:s_design/s_design.dart';

void
    main() {
  group(
      'Theme Consistency Tests',
      () {
    test(
        'All component themes should be registered in light theme',
        () {
      final theme =
          STheme();
      final lightTheme =
          theme.getLightTheme();

      // Verify all theme extensions are registered
      expect(lightTheme.extension<SButtonThemeData>(),
          isNotNull,
          reason: 'SButtonThemeData should be registered');
      expect(lightTheme.extension<SCardThemeData>(),
          isNotNull,
          reason: 'SCardThemeData should be registered');
      expect(lightTheme.extension<SCheckboxThemeData>(),
          isNotNull,
          reason: 'SCheckboxThemeData should be registered');
      expect(lightTheme.extension<SDialogThemeData>(),
          isNotNull,
          reason: 'SDialogThemeData should be registered');
      expect(lightTheme.extension<SDropdownMenuThemeData>(),
          isNotNull,
          reason: 'SDropdownMenuThemeData should be registered');
      expect(lightTheme.extension<SInputFieldThemeData>(),
          isNotNull,
          reason: 'SInputFieldThemeData should be registered');
      expect(lightTheme.extension<SListTileThemeData>(),
          isNotNull,
          reason: 'SListTileThemeData should be registered');
      expect(lightTheme.extension<SProgressBarThemeData>(),
          isNotNull,
          reason: 'SProgressBarThemeData should be registered');
      expect(lightTheme.extension<SSelectThemeData>(),
          isNotNull,
          reason: 'SSelectThemeData should be registered');
      expect(lightTheme.extension<SSonnerThemeData>(),
          isNotNull,
          reason: 'SSonnerThemeData should be registered');
      expect(lightTheme.extension<SSwitchThemeData>(),
          isNotNull,
          reason: 'SSwitchThemeData should be registered');
      expect(lightTheme.extension<STabsThemeData>(),
          isNotNull,
          reason: 'STabsThemeData should be registered');
      expect(lightTheme.extension<SToastThemeData>(),
          isNotNull,
          reason: 'SToastThemeData should be registered');
    });

    test(
        'All component themes should be registered in dark theme',
        () {
      final theme =
          STheme();
      final darkTheme =
          theme.getDarkTheme();

      // Verify all theme extensions are registered
      expect(darkTheme.extension<SButtonThemeData>(),
          isNotNull,
          reason: 'SButtonThemeData should be registered in dark theme');
      expect(darkTheme.extension<SCardThemeData>(),
          isNotNull,
          reason: 'SCardThemeData should be registered in dark theme');
      expect(darkTheme.extension<SCheckboxThemeData>(),
          isNotNull,
          reason: 'SCheckboxThemeData should be registered in dark theme');
      expect(darkTheme.extension<SDialogThemeData>(),
          isNotNull,
          reason: 'SDialogThemeData should be registered in dark theme');
      expect(darkTheme.extension<SDropdownMenuThemeData>(),
          isNotNull,
          reason: 'SDropdownMenuThemeData should be registered in dark theme');
      expect(darkTheme.extension<SInputFieldThemeData>(),
          isNotNull,
          reason: 'SInputFieldThemeData should be registered in dark theme');
      expect(darkTheme.extension<SListTileThemeData>(),
          isNotNull,
          reason: 'SListTileThemeData should be registered in dark theme');
      expect(darkTheme.extension<SProgressBarThemeData>(),
          isNotNull,
          reason: 'SProgressBarThemeData should be registered in dark theme');
      expect(darkTheme.extension<SSelectThemeData>(),
          isNotNull,
          reason: 'SSelectThemeData should be registered in dark theme');
      expect(darkTheme.extension<SSonnerThemeData>(),
          isNotNull,
          reason: 'SSonnerThemeData should be registered in dark theme');
      expect(darkTheme.extension<SSwitchThemeData>(),
          isNotNull,
          reason: 'SSwitchThemeData should be registered in dark theme');
      expect(darkTheme.extension<STabsThemeData>(),
          isNotNull,
          reason: 'STabsThemeData should be registered in dark theme');
      expect(darkTheme.extension<SToastThemeData>(),
          isNotNull,
          reason: 'SToastThemeData should be registered in dark theme');
    });

    test(
        'Light and dark themes should have different colors',
        () {
      final theme =
          STheme();
      final lightTheme =
          theme.getLightTheme();
      final darkTheme =
          theme.getDarkTheme();

      final lightButton =
          lightTheme.extension<SButtonThemeData>()!;
      final darkButton =
          darkTheme.extension<SButtonThemeData>()!;

      // Verify that light and dark themes have different primary colors
      expect(lightButton.defaultBackgroundColor,
          isNot(equals(darkButton.defaultBackgroundColor)),
          reason: 'Light and dark button themes should have different colors');
    });

    test(
        'Theme accessor extensions should work correctly',
        () {
      final theme =
          STheme();
      final lightTheme =
          theme.getLightTheme();

      // Create a widget context to test extension accessors
      testWidgets('Extension accessors return correct themes',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: lightTheme,
            home: Builder(
              builder: (context) {
                // Test all extension accessors
                expect(Theme.of(context).sButtonTheme, isNotNull);
                expect(Theme.of(context).sCardTheme, isNotNull);
                expect(Theme.of(context).sCheckboxTheme, isNotNull);
                expect(Theme.of(context).sDialogTheme, isNotNull);
                expect(Theme.of(context).sDropdownMenuTheme, isNotNull);
                expect(Theme.of(context).sInputFieldTheme, isNotNull);
                expect(Theme.of(context).sListTileTheme, isNotNull);
                expect(Theme.of(context).sProgressBarTheme, isNotNull);
                expect(Theme.of(context).sSelectTheme, isNotNull);
                expect(Theme.of(context).sSonnerTheme, isNotNull);
                expect(Theme.of(context).sSwitchTheme, isNotNull);
                expect(Theme.of(context).sTabsTheme, isNotNull);
                expect(Theme.of(context).sToastTheme, isNotNull);

                return const SizedBox();
              },
            ),
          ),
        );
      });
    });
  });
}
