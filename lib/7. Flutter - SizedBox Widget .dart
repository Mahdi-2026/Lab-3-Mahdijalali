import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('SizedBox Widget')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 26. Add a Row with SizedBox for spacing
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 32),
                  SizedBox(width: 20),
                  Icon(Icons.favorite, color: Colors.red, size: 32),
                ],
              ),
              const SizedBox(height: 24),
              const Text('First Text', style: TextStyle(fontSize: 22)),
              // 25. Change this height to 8, 40, and 80 to compare results
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Button after vertical gap'),
              ),
              // 28. Replace SizedBox with Padding and describe the difference
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: SizedBox(
                  width: 300, // 27. Make width 300
                  height: 60, // 27. Make height 60
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Fixed Size Button'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
