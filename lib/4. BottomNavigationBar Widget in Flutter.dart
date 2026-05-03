import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  // 16. Use List<Widget> for different tab content
  final List<Widget> pages = [
    Container(
      color: Colors.amber.shade100,
      child: const Center(
        child: Text('Home Page', style: TextStyle(fontSize: 24)),
      ),
    ),
    Container(
      color: Colors.lightBlue.shade100,
      child: const Center(
        child: Text('Courses Page', style: TextStyle(fontSize: 24)),
      ),
    ),
    Container(
      color: Colors.green.shade100,
      child: const Center(
        child: Text('Profile Page', style: TextStyle(fontSize: 24)),
      ),
    ),
    Container(
      color: Colors.purple.shade100,
      child: const Center(
        child: Text('Settings Page', style: TextStyle(fontSize: 24)),
      ),
    ),
  ];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('BottomNavigationBar')),
        // 14, 16. Show different widget for each tab
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: changePage,
          // 15. Set selectedItemColor
          selectedItemColor: Colors.indigo,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            // 13. Add Settings tab
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
