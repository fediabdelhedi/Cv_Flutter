// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_application_2/cv_chayma/HomePageC.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_2/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Create a mock context
    final BuildContext mockContext = MockBuildContext() as BuildContext;

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(context: mockContext)); // Provide the mock context

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
// Mock BuildContext class
class MockBuildContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement build method with necessary mocks
    return MaterialApp(home: Container());
  }
}
