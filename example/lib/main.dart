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
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SectionTitle(title: "Enhanced Card Animations"),
          buildEnhancedAnimatedCards(),

          const SectionTitle(title: "Scale & Rotation Animations"),
          buildScaleAndRotationIcons(),

          const SectionTitle(title: "Looping Text Animations"),
          buildLoopingText(),

          const SectionTitle(title: "Delayed Animations"),
          buildDelayedButtons(),

          const SectionTitle(title: "Custom Visibility Thresholds with Containers"),
          buildCustomVisibilityContainers(), // Modified Section

          // Adding extra padding at the bottom of the list to ensure scrolling past last widget
          const SizedBox(height: 400), // Large space to ensure full scrollability
        ],
      ),
    );
  }

  // Showcase scaling, rotation, and looping animations
  Widget buildScaleAndRotationIcons() {
    return Column(
      children: [
        ScrollAnimationWidget(
          index: 'scale_icon',
          alignment: Alignment.center,
          enableScale: true, // Enabling scale animation
          duration: const Duration(milliseconds: 800),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.stars, size: 50, color: Colors.purple),
          ),
        ),
        ScrollAnimationWidget(
          index: 'rotation_icon',
          alignment: Alignment.center,
          enableRotation: true, // Enabling rotation animation
          duration: const Duration(milliseconds: 800),
          curve: Curves.elasticInOut,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.rotate_right, size: 50, color: Colors.orange),
          ),
        ),
      ],
    );
  }

  // Showcase looping and alternating animations
  Widget buildLoopingText() {
    return Column(
      children: [
        ScrollAnimationWidget(
          index: 'looping_text_1',
          alignment: Alignment.centerLeft,
          loopAnimation: true, // Loop animation continuously
          duration: const Duration(seconds: 2),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'This text loops continuously.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ScrollAnimationWidget(
          index: 'looping_text_2',
          alignment: Alignment.centerRight,
          loopAnimation: true,
          alternate: true, // Alternate forward and reverse looping
          duration: const Duration(seconds: 2),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'This text alternates between forward and reverse.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  // Showcase delayed animations for staggered effects
  Widget buildDelayedButtons() {
    return Column(
      children: [
        ScrollAnimationWidget(
          index: 'delayed_button_1',
          alignment: Alignment.centerLeft,
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 200), // Delay animation by 200ms
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Button with 200ms delay'),
            ),
          ),
        ),
        ScrollAnimationWidget(
          index: 'delayed_button_2',
          alignment: Alignment.centerRight,
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 500), // Delay animation by 500ms
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Button with 500ms delay'),
            ),
          ),
        ),
      ],
    );
  }

  // Showcase custom visibility thresholds using containers instead of text
  Widget buildCustomVisibilityContainers() {
    return Column(
      children: [
        ScrollAnimationWidget(
          index: 'visibility_custom_container_1',
          alignment: Alignment.centerLeft,
          visibilityThreshold: 0.5, // Trigger when 50% visible
          duration: const Duration(milliseconds: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 150,
              height: 150,
              color: Colors.blue,
              child: Stack(
                children: [
                  // Dashed line at 50% height
                  Positioned(
                    top: 75, // 50% of container height
                    left: 0,
                    right: 0,
                    child: CustomPaint(
                      painter: DashedLinePainter(),
                      child: SizedBox(height: 1),
                    ),
                  ),
                  const Center(
                    child: Text(
                      '50% Visible',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ScrollAnimationWidget(
          index: 'visibility_custom_container_2',
          alignment: Alignment.centerRight,
          visibilityThreshold: 0.1, // Trigger when only 10% visible
          duration: const Duration(milliseconds: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
              child: Stack(
                children: [
                  // Dashed line at 10% height
                  Positioned(
                    top: 15, // 10% of container height
                    left: 0,
                    right: 0,
                    child: CustomPaint(
                      painter: DashedLinePainter(),
                      child: SizedBox(height: 1),
                    ),
                  ),
                  const Center(
                    child: Text(
                      '10% Visible',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


  // Showcase enhanced animations with reverse on exit
  Widget buildEnhancedAnimatedCards() {
    return Column(
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScrollAnimationWidget(
            index: 'enhanced_card_$index',
            alignment: index.isEven ? Alignment.centerRight : Alignment.centerLeft,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCubic,
            reverseOnExit: true, // Reverse animation when scrolled out
            enableScale: true,   // Add scaling to the card animation
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text('Enhanced Card $index'),
                subtitle: const Text('This card has enhanced animations.'),
              ),
            ),
          ),
        );
      }),
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

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final Axis direction;

  DashedLinePainter({
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
    this.direction = Axis.horizontal,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0;

    double startX = 0.0;
    double startY = 0.0;

    if (direction == Axis.horizontal) {
      while (startX < size.width) {
        canvas.drawLine(Offset(startX, 0.0), Offset(startX + dashWidth, 0.0), paint);
        startX += dashWidth + dashSpace;
      }
    } else {
      while (startY < size.height) {
        canvas.drawLine(Offset(0.0, startY), Offset(0.0, startY + dashWidth), paint);
        startY += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}