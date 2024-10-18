import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Implicit Animations',
      home: AnimationScreen(),
    );
  }
}

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  // Define initial properties for the AnimatedContainer
  double _width = 200.0;
  double _height = 200.0;
  Color _color = Colors.blue;
  double _borderRadius = 8.0;

  // Define a boolean flag for AnimatedOpacity
  bool _isTextVisible = true;

  // Method to toggle the AnimatedContainer properties
  void _animateContainer() {
    setState(() {
      _width = _width == 200.0 ? 300.0 : 200.0;
      _height = _height == 200.0 ? 300.0 : 200.0;
      _color = _color == Colors.blue ? Colors.green : Colors.blue;
      _borderRadius = _borderRadius == 8.0 ? 50.0 : 8.0;
    });
  }

  // Method to toggle the text visibility
  void _toggleTextVisibility() {
    setState(() {
      _isTextVisible = !_isTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Implicit Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer widget
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _animateContainer,
              child: const Text('Animate Container'),
            ),
            const SizedBox(height: 20),
            // AnimatedOpacity widget
            AnimatedOpacity(
              opacity: _isTextVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: const Text(
                'Hello!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleTextVisibility,
              child: const Text('Toggle Text Visibility'),
            ),
          ],
        ),
      ),
    );
  }
}
