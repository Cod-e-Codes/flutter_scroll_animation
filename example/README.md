# flutter_scroll_animation Example

This is a simple Flutter project that demonstrates how to use the `flutter_scroll_animation` package.

## Features Demonstrated

- **Scroll-driven animations**: Widgets become visible and animate into view when they enter the viewport.
- **Customizable animations**: You can modify the duration, direction, and curve of the animations.
- **Scaling and rotation**: Enable scale and rotation animations for a more dynamic effect.
- **Looping animations**: Loop animations continuously or alternate between forward and reverse.
- **Delayed animations**: Add a delay before animations start to create staggered effects.
- **Custom visibility thresholds**: Trigger animations when a widget reaches a specific visibility percentage in the viewport.

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
      body: ListView(
        children: [
          // Example of card animation with scaling and reverse on exit
          ScrollAnimationWidget(
            index: 'card_1',
            alignment: Alignment.centerLeft,
            enableScale: true,  // Enable scale animation
            reverseOnExit: true,  // Reverse when scrolled out
            child: Card(
              child: ListTile(
                title: Text('Item with Scale Animation'),
              ),
            ),
          ),

          // Example of icon rotation
          ScrollAnimationWidget(
            index: 'icon_1',
            alignment: Alignment.center,
            enableRotation: true,  // Enable rotation animation
            child: Icon(Icons.star, size: 50, color: Colors.yellow),
          ),

          // Example of looping text animation
          ScrollAnimationWidget(
            index: 'looping_text_1',
            alignment: Alignment.centerLeft,
            loopAnimation: true,  // Loop animation continuously
            child: Text('This text loops continuously'),
          ),

          // Example of delayed button animation
          ScrollAnimationWidget(
            index: 'delayed_button_1',
            alignment: Alignment.centerRight,
            delay: Duration(milliseconds: 300),  // 300ms delay before animation starts
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Button with delay'),
            ),
          ),

          // Example of custom visibility threshold
          ScrollAnimationWidget(
            index: 'custom_visibility_1',
            alignment: Alignment.center,
            visibilityThreshold: 0.5,  // Animation triggers at 50% visibility
            child: Container(
              width: 150,
              height: 150,
              color: Colors.blue,
              child: Center(child: Text('Visible at 50%')),
            ),
          ),
        ],
      ),
    );
  }
}
```

## Further Information

For more details on how to use the package and its advanced features like scaling, rotation, looping, custom visibility thresholds, and delayed animations, refer to the main [README](../README.md).
