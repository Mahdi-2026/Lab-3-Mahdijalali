import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String greeting = 'Enter your name';
  String? errorText;

  void updateGreeting() {
    setState(() {
      if (nameController.text.trim().isEmpty) {
        errorText = 'Name cannot be empty!';
        greeting = 'Enter your name';
      } else {
        greeting = 'Hello, ${nameController.text}!';
        errorText = null;
        nameController.clear(); // 47. Clear the name field
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('TextField')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Student name',
                  hintText: 'Enter your full name',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.person),
                  errorText: errorText, // 48. Show error if empty
                ),
              ),
              const SizedBox(height: 16),
              // 45 & 46. Add a second TextField for email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Student email',
                  hintText: 'Enter your email address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress, // 46
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: updateGreeting,
                child: const Text('Show Greeting'),
              ),
              const SizedBox(height: 16),
              Text(greeting, style: const TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }
}
