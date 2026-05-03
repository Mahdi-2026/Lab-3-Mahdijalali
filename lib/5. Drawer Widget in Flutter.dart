import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void selectMenu(BuildContext context, String title) {
    Navigator.pop(context);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$title selected')));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Drawer Widget')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // 18. Change DrawerHeader title to your app name
              // 19. Add a CircleAvatar inside the DrawerHeader
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.school, size: 40, color: Colors.indigo),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'My Flutter App',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Dashboard'),
                onTap: () => selectMenu(context, 'Dashboard'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () => selectMenu(context, 'Settings'),
              ),
              // 17. Add a third menu item named Help with Icons.help
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help'),
                onTap: () => selectMenu(context, 'Help'),
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text('Open the drawer from the AppBar menu icon.'),
        ),
      ),
    );
  }
}
