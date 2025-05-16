import 'package:flutter/material.dart';

class TeacherPage extends StatelessWidget {
  final String subjectName;

  const TeacherPage({super.key, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> teachers = [
      {
        "name": "Ing. Laura Méndez",
        "email": "lmendez@universidad.edu.bo",
        "avatar": "https://ui-avatars.com/api/?name=Laura+Mendez"
      },
      {
        "name": "Lic. Pablo Torres",
        "email": "ptorres@universidad.edu.bo",
        "avatar": "https://ui-avatars.com/api/?name=Pablo+Torres"
      },
      {
        "name": "MSc. Daniela Gómez",
        "email": "dgomez@universidad.edu.bo",
        "avatar": "https://ui-avatars.com/api/?name=Daniela+Gomez"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color(0xFFF5F7FB),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: teachers.length,
          itemBuilder: (context, index) {
            final teacher = teachers[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(teacher["avatar"]!),
                ),
                title: Text(teacher["name"]!),
                subtitle: Text(teacher["email"]!),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Ver materiales de ${teacher["name"]}")),
                    );
                    // Aquí podrías navegar a: TeacherDetailPage(teacherId)
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}