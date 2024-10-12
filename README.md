# flutter_scroll_animation

`flutter_scroll_animation` is a Flutter package that provides scroll-driven animations. Widgets become visible and animate into view as they enter the viewport, allowing for smooth and dynamic UI transitions.

## Features

- Detect when widgets come into view and animate them with customizable sliding and fading effects.
- Highly flexible and easy to integrate into any Flutter app.
- Customizable animation duration, direction, and curves.

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

## Additional Information

For more examples, see the `example` folder in the repository. If you encounter any issues, have feature requests, or want to contribute, feel free to open an issue or submit a pull request on GitHub.

- Visit the [GitHub repository](https://github.com/cod-e-codes/flutter_scroll_animation) for more details, support, and contributions.
- File an issue if you encounter bugs or have suggestions.
- Contributions are welcome! Please read the contribution guidelines before submitting pull requests.
