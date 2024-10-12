import 'package:flutter/material.dart';
import 'package:flutter_scroll_animation/flutter_scroll_animation.dart'; // Import your package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scroll Animation Demo',
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
      appBar: AppBar(title: const Text('Scroll Animation Demo')),
      body: ListView(
        children: [
          const SectionTitle(title: "Card Animations"),
          buildAnimatedCards(),

          const SectionTitle(title: "Icon Animations"),
          buildAnimatedIcons(),

          const SectionTitle(title: "Text Animations"),
          buildAnimatedText(),

          const SectionTitle(title: "Button Animations"),
          buildAnimatedButtons(),

          const SectionTitle(title: "Switch & Checkbox Animations"),
          buildAnimatedSwitchesAndCheckboxes(),

          const SectionTitle(title: "Container Animations"),
          buildAnimatedContainers(),
        ],
      ),
    );
  }

  Widget buildAnimatedCards() {
    return Column(
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScrollAnimationWidget(
            index: 'card_$index',
            alignment: index.isEven ? Alignment.centerRight : Alignment.centerLeft,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCubic,
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text('Card $index'),
                subtitle: const Text('This is a description of the card.'),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildAnimatedIcons() {
    return Column(
      children: [
        ScrollAnimationWidget(
          index: 'icon_1',
          alignment: Alignment.centerLeft,
          duration: const Duration(milliseconds: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.star, size: 50, color: Colors.amber),
          ),
        ),
        ScrollAnimationWidget(
          index: 'icon_2',
          alignment: Alignment.centerRight,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutBack,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.favorite, size: 50, color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget buildAnimatedText() {
    return Column(
      children: [
        ScrollAnimationWidget(
          index: 'text_1',
          alignment: Alignment.centerLeft,
          duration: const Duration(milliseconds: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Smooth scrolling text animation on the left.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ScrollAnimationWidget(
          index: 'text_2',
          alignment: Alignment.centerRight,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutBack,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Smooth scrolling text animation on the right.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAnimatedButtons() {
    return Column(
      children: [
        ScrollAnimationWidget(
          index: 'button_1',
          alignment: Alignment.centerLeft,
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Animated Button 1'),
            ),
          ),
        ),
        ScrollAnimationWidget(
          index: 'button_2',
          alignment: Alignment.centerRight,
          duration: const Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Animated Button 2'),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAnimatedSwitchesAndCheckboxes() {
    return Column(
      children: [
        ScrollAnimationWidget(
          index: 'switch_1',
          alignment: Alignment.centerLeft,
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Switch 1'),
                Switch(value: true, onChanged: (value) {}),
              ],
            ),
          ),
        ),
        ScrollAnimationWidget(
          index: 'checkbox_1',
          alignment: Alignment.centerRight,
          duration: const Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Checkbox 1'),
                Checkbox(value: true, onChanged: (value) {}),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAnimatedContainers() {
    return Column(
      children: [
        ScrollAnimationWidget(
          index: 'container_1',
          alignment: Alignment.centerLeft,
          duration: const Duration(milliseconds: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Box 1',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        ScrollAnimationWidget(
          index: 'container_2',
          alignment: Alignment.centerRight,
          duration: const Duration(milliseconds: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Box 2',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
