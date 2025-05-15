import 'package:flutter/material.dart';
import '../../models/course.dart';
import '../../services/mock_data.dart';
import '../../widgets/cards/course_card.dart';
import '../../widgets/inputs/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Course> myCourses = MockData.getMyCourses();
    final List<Course> popularCourses = MockData.getPopularCourses();

    return Scaffold(
      backgroundColor: const Color(0xfff9f7f1),
      appBar: AppBar(
        title: const Text('Mis Cursos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CustomSearchBar(),
              const SizedBox(height: 20),
              _buildSection('Encuentra quiz', _buildQuizSection()),
              _buildSection('Mis cursos', _buildCourseList(myCourses)),
              _buildSection('Seguir leyendo', _buildCourseList(popularCourses)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/upload'),
        child: const Icon(Icons.upload),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        content,
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildQuizSection() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.auto_awesome, color: Colors.deepPurple),
        title: const Text('Pregunta a la IA'),
        subtitle: const Text('Obtén respuestas instantáneas'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {}, // Navegar a IA
      ),
    );
  }

  Widget _buildCourseList(List<Course> courses) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (_, index) => CourseCard(course: courses[index]),
    );
  }
}