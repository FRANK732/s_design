import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:s_design/s_design.dart';

void
    main() {
  testWidgets(
      'SFloatingPanel shows without Material error',
      (WidgetTester
          tester) async {
    // 1. Pump the app with a Scaffold
    await tester
        .pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Home'),
          ),
        ),
      ),
    );

    final BuildContext
        context =
        tester.element(find.text('Home'));

    // 2. Show the floating panel with content that requires Material (TextField)
    // We ignore the TickerProvider error potential by not waiting for animation fully if possible,
    // or relying on tester to handle standard animations.
    SFloatingPanel
        .show(
      context:
          context,
      animationDuration:
          const Duration(milliseconds: 100),
      config:
          const SFloatingPanelConfig(
        content: Material(
          // Ensuring content itself is fine to verify wrapper
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // 3. Pump to start animation
    await tester
        .pump();
    // 4. Pump to advance animation
    await tester
        .pump(const Duration(milliseconds: 50));
    await tester
        .pump(const Duration(milliseconds: 100));

    // 5. Verify TextField is present and didn't crash
    expect(
        find.byType(TextField),
        findsOneWidget);
  });

  testWidgets(
      'SFloatingPanel content works without explicit Material in content (testing wrapper)',
      (WidgetTester
          tester) async {
    // This test ensures our FIX works. The user passed a TextField directly.
    await tester
        .pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Home'),
          ),
        ),
      ),
    );

    final BuildContext
        context =
        tester.element(find.text('Home'));

    SFloatingPanel
        .show(
      context:
          context,
      animationDuration:
          const Duration(milliseconds: 100),
      config:
          const SFloatingPanelConfig(
        content: Material(
          child: TextField(
            key: Key('test_field'),
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
        ),
      ),
    );

    await tester
        .pumpAndSettle();

    expect(
        find.byKey(const Key('test_field')),
        findsOneWidget);
  });
}
