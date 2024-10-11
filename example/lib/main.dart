import 'package:flutter/material.dart';
import 'package:flutter_scroll_animation/flutter_scroll_animation.dart';  // Import your package

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
