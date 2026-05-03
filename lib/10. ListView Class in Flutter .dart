import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<String> courses = const [
    'Flutter Basics',
    'Dart Programming',
    'UI Design',
    'State Management',
    'Firebase Integration',
    'Final Project',
    'Animations',
    'API Integration',
    'Deployment',
  ];

  final List<String> durations = const [
    '4 weeks',
    '3 weeks',
    '2 weeks',
    '3 weeks',
    '2 weeks',
    '1 week',
    '2 weeks',
    '2 weeks',
    '1 week',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('ListView Class')),
        body: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.indigo.shade100),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(courses[index]),
                // 38. Subtitle with course duration
                subtitle: Text('Duration: ${durations[index]}'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                // 39. Show SnackBar with course name
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: ${courses[index]}')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
