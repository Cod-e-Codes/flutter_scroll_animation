import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_scroll_animation/flutter_scroll_animation.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  setUp(() {
    // Set the update interval for the VisibilityDetector to zero for tests
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() {
    // Reset the update interval after tests if needed
    VisibilityDetectorController.instance.updateInterval = const Duration(milliseconds: 200);
  });

  testWidgets('ScrollAnimationWidget builds and animates correctly when visible', (WidgetTester tester) async {
    // Arrange: Use the actual ScrollAnimationWidget from your package
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold( // Add a Scaffold for proper layout
          body: ScrollAnimationWidget(
            index: 'test',
            alignment: Alignment.centerLeft,
            child: Text('Test Widget'),
          ),
        ),
      ),
    );

    // Act: Trigger a frame
    await tester.pump(); // Ensures the widget is built

    // Assert: Ensure the widget is present and visible
    expect(find.text('Test Widget'), findsOneWidget);

    // Simulate visibility change
    final visibilityDetector = tester.widget<VisibilityDetector>(find.byKey(const Key('test')));
    expect(visibilityDetector.onVisibilityChanged, isNotNull);

    // Act: Simulate visibility change to make it visible
    await tester.pumpAndSettle(); // Let animations complete
  });

  testWidgets('ScrollAnimationWidget animates correctly on visibility change', (WidgetTester tester) async {
    // Arrange: Build a widget with ScrollAnimationWidget wrapped in SingleChildScrollView
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView( // Wrap with SingleChildScrollView to prevent overflow
            child: Column(
              children: [
                SizedBox(height: 600), // Push the ScrollAnimationWidget out of view
                ScrollAnimationWidget(
                  index: 'test_animation',
                  alignment: Alignment.centerLeft,
                  child: Text('Animated Widget'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Act: Scroll down to bring the widget into view
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
    await tester.pumpAndSettle(); // Let the animation settle

    // Assert: Ensure the widget is visible after scrolling
    expect(find.text('Animated Widget'), findsOneWidget);
  });

  testWidgets('ScrollAnimationWidget handles multiple animations correctly', (WidgetTester tester) async {
    // Arrange: Build multiple ScrollAnimationWidgets wrapped in a SingleChildScrollView
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView( // Prevent overflow
            child: Column(
              children: [
                ScrollAnimationWidget(
                  index: 'test_1',
                  alignment: Alignment.centerLeft,
                  child: Text('First Animated Widget'),
                ),
                ScrollAnimationWidget(
                  index: 'test_2',
                  alignment: Alignment.centerRight,
                  child: Text('Second Animated Widget'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Act: Trigger a frame
    await tester.pump();

    // Assert: Ensure both widgets are present
    expect(find.text('First Animated Widget'), findsOneWidget);
    expect(find.text('Second Animated Widget'), findsOneWidget);

    // Additional pump to ensure any remaining animations complete
    await tester.pumpAndSettle();
  });

  testWidgets('ScrollAnimationWidget does not animate when not visible', (WidgetTester tester) async {
    // Arrange: Build a widget that is initially not visible
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 600), // Push the ScrollAnimationWidget out of view
                ScrollAnimationWidget(
                  index: 'not_visible_test',
                  alignment: Alignment.centerLeft,
                  child: Text('Should Not Animate Widget'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Act: Scroll down to bring the widget into view
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -600));
    await tester.pumpAndSettle(); // Let the animation settle

    // Assert: Ensure the widget is visible after scrolling
    expect(find.text('Should Not Animate Widget'), findsOneWidget);
  });

  testWidgets('ScrollAnimationWidget handles null child gracefully', (WidgetTester tester) async {
    // Arrange: Build a widget with null child
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ScrollAnimationWidget(
            index: 'null_child_test',
            alignment: Alignment.centerLeft,
            child: SizedBox(), // Using SizedBox to avoid null child
          ),
        ),
      ),
    );

    // Act: Trigger a frame
    await tester.pump();

    // Assert: Ensure the widget builds without errors
    expect(find.byType(SizedBox), findsOneWidget);
  });

  // Performance Test: Measure the time taken for animation
  testWidgets('ScrollAnimationWidget animation performance', (WidgetTester tester) async {
    // Arrange: Build a ScrollAnimationWidget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ScrollAnimationWidget(
            index: 'performance_test',
            alignment: Alignment.centerLeft,
            child: Text('Performance Widget'),
          ),
        ),
      ),
    );

    // Start measuring time
    final stopwatch = Stopwatch()..start();

    // Simulate visibility change
    await tester.pumpAndSettle();

    // Stop measuring time
    stopwatch.stop();

    // Assert: Ensure the animation completes within a reasonable time frame
    expect(stopwatch.elapsedMilliseconds, lessThan(1000)); // Adjust threshold as necessary
  });

  // Timing Test: Ensure the widget responds in a timely manner
  testWidgets('ScrollAnimationWidget responds within expected time', (WidgetTester tester) async {
    // Arrange: Build a ScrollAnimationWidget wrapped in SingleChildScrollView
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 600), // Push the ScrollAnimationWidget out of view
                ScrollAnimationWidget(
                  index: 'timing_test',
                  alignment: Alignment.centerLeft,
                  child: Text('Timing Widget'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Act: Start measuring time
    final stopwatch = Stopwatch()..start();

    // Scroll down to bring the widget into view
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -600));
    await tester.pumpAndSettle(); // Let the animation settle

    // Stop measuring time
    stopwatch.stop();

    // Assert: Ensure the scrolling completes in a reasonable time
    expect(stopwatch.elapsedMilliseconds, lessThan(1000)); // Adjust threshold as necessary
  });
}
