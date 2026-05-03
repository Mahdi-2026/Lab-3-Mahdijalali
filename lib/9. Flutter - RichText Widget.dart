import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const baseStyle = TextStyle(fontSize: 22, color: Colors.black87);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('RichText Widget')),
        body: Center(
          // 36. Example using Text.rich
          child: Text.rich(
            TextSpan(
              style: baseStyle,
              children: [
                const TextSpan(text: 'Flutter '),
                // 33. Change to course name and make it green
                const TextSpan(
                  text: 'Mobile Programming ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const TextSpan(text: 'allows '),
                // 34. Add italic style
                const TextSpan(
                  text: 'multiple styles',
                  style: TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                // 35. Final sentence with fontSize 26
                const TextSpan(
                  text: ' in one paragraph.',
                  style: TextStyle(fontSize: 26),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
