import 'package:flutter/material.dart';

void main() {
  runApp(StudentCourseApp());
}

class StudentCourseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Course App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: RootScreen(),
    );
  }
}

// 50. Root screen as StatefulWidget
class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  // 51. selectedIndex for BottomNavigationBar
  int selectedIndex = 0;

  // 55. TextEditingController for student name
  final TextEditingController _nameController = TextEditingController();
  String greeting = "Hello, Student!";

  // 53. Course names list
  final List<String> courses = [
    "Mathematics",
    "Physics",
    "Chemistry",
    "Biology",
    "Computer Science",
  ];

  void _onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _onFabPressed() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Add course clicked")));
  }

  // 52. Home tab
  Widget buildHomeTab() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.indigo.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.indigo.shade200,
                padding: EdgeInsets.all(12),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(text: "Welcome to "),
                      TextSpan(
                        text: "Student Course App",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Explore courses and manage your profile easily."),
          ],
        ),
      ),
    );
  }

  // 52. Courses tab
  Widget buildCoursesTab() {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: Icon(Icons.book),
            title: Text(courses[index]),
          ),
        );
      },
    );
  }

  // 52. Profile tab
  Widget buildProfileTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  greeting = "Hello, $value!";
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              greeting,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // 54. GridView with shrinkWrap + physics
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: [
                _buildCategoryCard(Icons.code, "Programming"),
                _buildCategoryCard(Icons.science, "Science"),
                _buildCategoryCard(Icons.calculate, "Math"),
                _buildCategoryCard(Icons.history, "History"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String label) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.indigo),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [buildHomeTab(), buildCoursesTab(), buildProfileTab()];

    return Scaffold(
      appBar: AppBar(
        title: Text("Student Course App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Search clicked")));
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Notifications clicked")));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                "Navigation Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                setState(() => selectedIndex = 0);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("Courses"),
              onTap: () {
                Navigator.pop(context);
                setState(() => selectedIndex = 1);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                setState(() => selectedIndex = 2);
              },
            ),
          ],
        ),
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
