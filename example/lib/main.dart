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

          const SectionTitle(title: "Image Animations"),
          buildAnimatedImages(),

          const SectionTitle(title: "Text Animations"),
          buildAnimatedText(),

          const SectionTitle(title: "Button Animations"),
          buildAnimatedButtons(),
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

  Widget buildAnimatedImages() {
    return Column(
      children: [
        ScrollAnimationWidget(
          index: 'image_1',
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 700),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://via.placeholder.com/400x200.png?text=Animated+Image+1',
                height: 200,
              ),
            ),
          ),
        ),
        ScrollAnimationWidget(
          index: 'image_2',
          alignment: Alignment.centerRight,
          duration: const Duration(milliseconds: 700),
          curve: Curves.bounceIn,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://via.placeholder.com/400x200.png?text=Animated+Image+2',
                height: 200,
              ),
            ),
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
