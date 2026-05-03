import 'package:flutter/material.dart';

class StudentCourseApp extends StatefulWidget {
  const StudentCourseApp({super.key});

  @override
  State<StudentCourseApp> createState() => _StudentCourseAppState();
}

class _StudentCourseAppState extends State<StudentCourseApp> {
  int selectedIndex = 0;
  final TextEditingController nameController = TextEditingController();
  String greeting = "Hello, Student!";

  // Home Tab
  Widget buildHomeTab() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
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
                padding: const EdgeInsets.all(12),
                child: RichText(
                  text: const TextSpan(
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
            const SizedBox(height: 20),
            const Text("Explore courses and manage your profile easily."),
          ],
        ),
      ),
    );
  }

  // Courses Tab
  Widget buildCoursesTab() {
    final courses = [
      "Mathematics",
      "Physics",
      "Chemistry",
      "Biology",
      "Computer Science",
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          // ListView of courses
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(courses[index]),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          // GridView of categories
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
    );
  }

  Widget _buildCategoryCard(IconData icon, String label) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.indigo),
          const SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }

  // Profile Tab
  Widget buildProfileTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Enter your name",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                greeting = "Hello, $value!";
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            greeting,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [buildHomeTab(), buildCoursesTab(), buildProfileTab()];

    return Scaffold(
      appBar: AppBar(title: const Text("Student Course App")),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Add course clicked")));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
