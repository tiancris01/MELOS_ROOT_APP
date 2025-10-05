import 'package:flutter_test/flutter_test.dart';
import 'package:melos_root_app/main.dart';

void main() {
  group('Melos Root App Tests', () {
    testWidgets('App loads correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the app title is correct
      expect(find.text('Melos useRootAsPackage Demo'), findsOneWidget);

      // Verify that counter starts at 0
      expect(find.text('0'), findsOneWidget);

      // Verify that demo sections are present
      expect(find.text('Counter Demo'), findsOneWidget);
      expect(find.text('Utils Package Demo'), findsOneWidget);
      expect(find.text('Melos useRootAsPackage Demo'), findsAtLeastNWidgets(1));
    });

    testWidgets('Counter increments correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find and tap the increment button
      await tester.tap(find.text('INCREMENT COUNTER'));
      await tester.pump();

      // Verify that counter has incremented
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });

    testWidgets('Utils test button works', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Find and tap the test utilities button
      await tester.tap(find.text('TEST UTILITIES'));
      await tester.pump();

      // Verify that results are displayed
      expect(find.textContaining('Utils Test Results:'), findsOneWidget);
      expect(find.textContaining('Capitalized:'), findsOneWidget);
      expect(find.textContaining('Factorial of 5:'), findsOneWidget);
    });
  });
}
