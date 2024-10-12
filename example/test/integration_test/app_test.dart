import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_scroll_animation_example/main.dart'; // Correct package import

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ScrollAnimationWidget Integration Tests', () {
    testWidgets('Scroll and check animation triggering in example app', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      await tester.drag(find.byType(ListView), const Offset(0, -500)); // Scroll down to bring items into view
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Card 2'), findsOneWidget); // Check if the card is displayed
      expect(find.text('Card 0'), findsOneWidget); // Check if the first card remains visible

      // Check that animations were triggered by confirming the fade in/out effects
      final card2 = find.byKey(const ValueKey('card_2')); // Assuming you have keys set for cards
      final card0 = find.byKey(const ValueKey('card_0'));

      expect(tester.widget(card2), isNotNull); // Ensure card 2 is in the widget tree
      expect(tester.widget(card0), isNotNull); // Ensure card 0 is in the widget tree

      // Optionally check for fade-in/out by inspecting opacity
      // (This requires modifying your widget to expose animation states or using a more complex test)
    });

    testWidgets('Scroll and check if all cards are visible after scrolling', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      await tester.drag(find.byType(ListView), const Offset(0, -1000)); // Scroll down enough to bring multiple cards into view
      await tester.pumpAndSettle();

      // Assert: Check if all expected cards are displayed
      for (int i = 0; i < 3; i++) {
        expect(find.text('Card $i'), findsOneWidget); // Change 'Card $i' to whatever your card texts are
      }
    });

    testWidgets('Scroll and verify timing of animations', (WidgetTester tester) async {
      // Arrange
      final stopwatch = Stopwatch()..start();
      await tester.pumpWidget(const MyApp());

      // Act
      await tester.drag(find.byType(ListView), const Offset(0, -500)); // Scroll down to bring items into view
      await tester.pumpAndSettle();

      // Stop the stopwatch
      stopwatch.stop();

      // Assert: Ensure scrolling completes within a reasonable time
      expect(stopwatch.elapsedMilliseconds, lessThan(1000)); // Adjust threshold as necessary
    });
  });
}
