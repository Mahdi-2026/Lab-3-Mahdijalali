import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Standard setup: stateless widget
class MyApp extends StatelessWidget {
  // 44. Grid of course modules instead of device icons
  final List<Map<String, dynamic>> modules = [
    {'icon': Icons.book, 'label': 'Introduction'},
    {'icon': Icons.code, 'label': 'Dart Basics'},
    {'icon': Icons.phone_android, 'label': 'Flutter UI'},
    {'icon': Icons.storage, 'label': 'State Mgmt'},
    {'icon': Icons.cloud, 'label': 'Firebase'},
    {'icon': Icons.assignment, 'label': 'Final Project'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Dashboard")),
        body: GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: modules.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 41. Change to 3 columns
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            // 43. Change tile color based on index
            final tileColor = index.isEven
                ? Colors.blue.shade100
                : Colors.green.shade100;
            return Container(
              decoration: BoxDecoration(
                color: tileColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    modules[index]['icon'],
                    size: 48,
                    color: index.isEven
                        ? Colors.blue.shade900
                        : Colors.green.shade900,
                  ),
                  const SizedBox(height: 8),
                  // 42. Add text label under icon
                  Text(
                    modules[index]['label'],
                    style: TextStyle(
                      fontSize: 16,
                      color: index.isEven
                          ? Colors.blue.shade900
                          : Colors.green.shade900,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
