import 'package:example/modern_example.dart';
import 'package:flutter_test/flutter_test.dart';

void
    main() {
  testWidgets(
      'Modern example app smoke test',
      (WidgetTester
          tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(const ModernSDesignExample());

    // Verify that the app title is present.
    expect(
        find.text('sDesign - Clean Architecture'),
        findsOneWidget);
    expect(
        find.text('Modern Component Library'),
        findsOneWidget);
  });
}
