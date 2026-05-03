import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // 5. Change the AppBar title
          title: const Text('Student Dashboard'),
          // 7. Set centerTitle: true
          centerTitle: true,
          // 8. Change the leading icon and print when tapped
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              print('Back pressed');
            },
          ),
          // 6. Add one more IconButton with Icons.notifications
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Add your notification logic here
              },
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Button pressed: $counter times',
            style: const TextStyle(fontSize: 22),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: increaseCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
