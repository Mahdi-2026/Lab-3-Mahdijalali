import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Container Class')),
        body: Center(
          child: Container(
            width: 300, // Changed width to 300
            height: 200, // Changed height to 200
            margin: const EdgeInsets.all(32), // Changed margin
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 32,
            ), // Changed padding
            decoration: BoxDecoration(
              // 22. Use a gradient
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              // 23. Add a border
              border: Border.all(color: Colors.black, width: 2),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 8,
                  offset: Offset(2, 4),
                  color: Colors.black26,
                ),
              ],
            ),
            child: const Text(
              'Container with size, margin, padding, gradient, border, radius, and shadow.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
