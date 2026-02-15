import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:s_design/s_design.dart';

void
    main() {
  group(
      'STabs Widget Tests',
      () {
    final List<STabItem>
        testItems =
        [
      STabItem(
        label: 'Tab 1',
        key: 'tab1',
        content: const Text('Content 1'),
      ),
      STabItem(
        label: 'Tab 2',
        key: 'tab2',
        content: const Text('Content 2'),
      ),
    ];

    testWidgets(
        'renders tabs with correct labels',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: STabs(items: testItems),
          ),
        ),
      );

      expect(find.text('Tab 1'),
          findsOneWidget);
      expect(find.text('Tab 2'),
          findsOneWidget);
      expect(find.text('Content 1'),
          findsOneWidget);
    });

    testWidgets(
        'switches content when tab is clicked',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: STabs(items: testItems),
          ),
        ),
      );

      // Initial state
      expect(find.text('Content 1'),
          findsOneWidget);
      expect(find.text('Content 2'),
          findsNothing);

      // Tap Tab 2
      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();

      // Verified state
      expect(find.text('Content 1'),
          findsNothing);
      expect(find.text('Content 2'),
          findsOneWidget);
    });

    testWidgets(
        'supports controlled mode via activeKey',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: STabs(
              items: testItems,
              activeKey: 'tab2',
            ),
          ),
        ),
      );

      expect(find.text('Content 2'),
          findsOneWidget);
    });

    testWidgets(
        'calls onTabClick callback',
        (WidgetTester tester) async {
      String?
          clickedKey;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: STabs(
              items: testItems,
              onTabClick: (key) => clickedKey = key,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tab 2'));
      expect(clickedKey,
          'tab2');
    });

    testWidgets(
        'renders icons when provided',
        (WidgetTester tester) async {
      final itemsWithIcons =
          [
        STabItem(
          label: 'Tab 1',
          key: 'tab1',
          icon: const Icon(Icons.home),
          content: const Text('Content 1'),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: STabs(items: itemsWithIcons),
          ),
        ),
      );

      expect(find.byIcon(Icons.home),
          findsOneWidget);
    });

    testWidgets(
        'respects disabled state',
        (WidgetTester tester) async {
      final disabledItems =
          [
        STabItem(
          label: 'Tab 1',
          key: 'tab1',
          content: const Text('Content 1'),
        ),
        STabItem(
          label: 'Tab 2',
          key: 'tab2',
          disabled: true,
          content: const Text('Content 2'),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: STabs(items: disabledItems),
          ),
        ),
      );

      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();

      // Should still show content 1 because tab 2 is disabled
      expect(find.text('Content 1'),
          findsOneWidget);
      expect(find.text('Content 2'),
          findsNothing);
    });

    testWidgets(
        'renders add button for editableCard type',
        (WidgetTester tester) async {
      bool
          addClicked =
          false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: STabs(
              items: testItems,
              type: STabType.editableCard,
              onEdit: (key, action) {
                if (action == 'add') addClicked = true;
              },
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add),
          findsOneWidget);
      await tester.tap(find.byIcon(Icons.add));
      expect(addClicked,
          isTrue);
    });

    testWidgets(
        'renders extra content',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: STabs(
              items: testItems,
              tabBarExtraContent: const Text('Extra Info'),
            ),
          ),
        ),
      );

      expect(find.text('Extra Info'),
          findsOneWidget);
    });

    testWidgets(
        'swipes content to switch tabs',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 600,
              child: STabs(items: testItems),
            ),
          ),
        ),
      );

      // Initial state
      expect(find.text('Content 1'),
          findsOneWidget);

      // Swipe left strongly
      await tester.drag(find.text('Content 1'),
          const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Should be on tab 2
      expect(find.text('Content 2'),
          findsOneWidget);
    });
  });
}
