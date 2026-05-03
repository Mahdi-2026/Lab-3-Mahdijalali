import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void decreaseCounter() {
    setState(() {
      counter--;
    });
  }

  void showMessage() {
    debugPrint('Search button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Widget'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          leading: const Icon(Icons.menu),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: showMessage),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                debugPrint('More options pressed');
              },
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Counter: $counter',
            style: const TextStyle(fontSize: 22),
          ),
        ),
        // 12. Set FAB location
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // 9, 10, 11. FAB icon, decrease counter, tooltip
        floatingActionButton: FloatingActionButton(
          onPressed: decreaseCounter,
          tooltip: 'Add one',
          child: const Icon(Icons.favorite),
        ),
      ),
    );
  }
}
