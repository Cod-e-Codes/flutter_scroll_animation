# flutter_scroll_animation Example

This is a simple Flutter project that demonstrates how to use the `flutter_scroll_animation` package.

## Features Demonstrated

- **Scroll-driven animations**: Widgets become visible and animate into view when they enter the viewport.
- **Customizable animations**: You can modify the duration, direction, and curve of the animations.

## Getting Started

To run this example, navigate to the `example` directory and use the following commands:

```bash
flutter pub get
flutter run
```

## Code Overview

The main code for this example can be found in `lib/main.dart`. It demonstrates how to use the `ScrollAnimationWidget` to animate items in a `ListView` as they come into view.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_scroll_animation/flutter_scroll_animation.dart';  // Import the package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scroll Animation Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scroll Animation Example')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ScrollAnimationWidget(
              index: 'item_$index',
              alignment: index.isEven ? Alignment.centerRight : Alignment.centerLeft,
              child: Card(
                child: ListTile(
                  title: Text('Item $index'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
```

## Further Information

For more details on how to use the package, see the main [README](../README.md).
