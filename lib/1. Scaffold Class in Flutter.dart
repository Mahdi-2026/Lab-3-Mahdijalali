import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scaffold Demo',
      home: Scaffold(
        // 1. Change background color
        backgroundColor: Colors.amber.shade100,
        appBar: AppBar(
          title: const Text('Scaffold Example'),
          centerTitle: true,
        ),
        body: const Center(
          // 3. Wrap content in a Column and add a second Text widget
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 2. Replace with your full name and student ID
              Text(
                'Your Full Name - YourStudentID',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                'Second Text Widget',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
