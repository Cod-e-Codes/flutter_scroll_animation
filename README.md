# flutter_scroll_animation

`flutter_scroll_animation` is a Flutter package that provides scroll-driven animations. Widgets become visible and animate into view as they enter the viewport, allowing for smooth and dynamic UI transitions.

## Features

- Detect when widgets come into view and animate them with customizable sliding and fading effects.
- New features include scaling, rotation, and looping animations.
- Custom visibility thresholds for triggering animations at specified points.
- Optional delay for staggered animations.
- Highly flexible and easy to integrate into any Flutter app.
- Customizable animation duration, direction, curves, and behavior on exit.

## Getting Started

To use this package, add `flutter_scroll_animation` to your `pubspec.yaml` file.


```yaml
dependencies:
  flutter_scroll_animation: ^0.0.1
```

Then, run:

```bash
flutter pub get
```

## Usage

Here is an example of how to use the `ScrollAnimationWidget` in your app:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_scroll_animation/flutter_scroll_animation.dart';

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

## Customization

You can customize the duration and the curve of the animation by passing them as parameters to `ScrollAnimationWidget`. Here’s an example:

```dart
ScrollAnimationWidget(
  index: 'item_1',
  alignment: Alignment.centerLeft,
  duration: Duration(milliseconds: 700),
  curve: Curves.easeInOut,
  child: YourWidget(),
)
```

You can now enable scaling and rotation animations by setting the `enableScale` and `enableRotation` properties.

```dart
ScrollAnimationWidget(
index: 'scale_icon',
alignment: Alignment.center,
enableScale: true, // Enable scale animation
enableRotation: true, // Enable rotation animation
duration: Duration(milliseconds: 800),
child: Icon(Icons.star, size: 50, color: Colors.amber),
)
```

You can loop animations continuously by setting the `loopAnimation` property, and alternate the looping direction by setting `alternate`.

```dart
ScrollAnimationWidget(
  index: 'looping_text',
  alignment: Alignment.centerLeft,
  loopAnimation: true, // Loop animation continuously
  alternate: true,     // Alternate between forward and reverse
  duration: Duration(seconds: 2),
  child: Text('Looping Animation'),
)
```

Stagger animations by specifying a delay before the animation starts.
```dart
ScrollAnimationWidget(
  index: 'delayed_button',
  alignment: Alignment.centerLeft,
  delay: Duration(milliseconds: 500), // Delay animation by 500ms
  child: ElevatedButton(
    onPressed: () {},
    child: Text('Delayed Animation'),
  ),
)
```

You can customize the percentage of visibility needed to trigger the animation using `visibilityThreshold`.
```dart
ScrollAnimationWidget(
  index: 'custom_visibility',
  alignment: Alignment.centerLeft,
  visibilityThreshold: 0.5, // Trigger animation when 50% visible
  duration: Duration(milliseconds: 600),
  child: Container(
    width: 150,
    height: 150,
    color: Colors.blue,
    child: Center(child: Text('50% Visible')),
  ),
)
```

## Advanced Customization

The package provides many additional customization options:
- `reverseOnExit`: Reverse the animation when the widget exits the viewport.
- `resetOnScroll`: Reset the animation when the widget is scrolled out of view.
- `onAnimationStart` and `onAnimationEnd`: Optional callbacks to handle events when the animation starts and ends.

Example of using advanced options:
```dart
ScrollAnimationWidget(
  index: 'advanced_example',
  alignment: Alignment.center,
  reverseOnExit: true,
  enableFade: true,
  resetOnScroll: true,
  onAnimationStart: () => print('Animation started!'),
  onAnimationEnd: () => print('Animation ended!'),
  child: Text('Advanced Scroll Animation'),
)
```

## Additional Information

For more examples, see the `example` folder in the repository. If you encounter any issues, have feature requests, or want to contribute, feel free to open an issue or submit a pull request on GitHub.

- Visit the [GitHub repository](https://github.com/cod-e-codes/flutter_scroll_animation) for more details, support, and contributions.
- File an issue if you encounter bugs or have suggestions.
- Contributions are welcome! Please read the contribution guidelines before submitting pull requests.
