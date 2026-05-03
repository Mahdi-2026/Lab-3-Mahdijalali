import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('ClipRRect Widget')),
        body: Center(
          // 32. Wrap with SizedBox to test size effect
          child: SizedBox(
            width: 300,
            height: 180,
            child: ClipRRect(
              // Try changing borderRadius to 8, 40, and 80 to compare results
              // borderRadius: BorderRadius.circular(24),
              // 31. Use BorderRadius.only for custom corners
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              // 30. Replace Container with Image.network or Image.asset
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                width: 280,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
