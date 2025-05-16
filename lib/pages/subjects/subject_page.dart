import 'package:flutter/material.dart';


class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subjects = [
      {"name": "Física I", "color": Colors.blue, "icon": Icons.science},
      {"name": "Cálculo II", "color": Colors.green, "icon": Icons.functions},
      {"name": "Programación Aplicada", "color": Colors.orange, "icon": Icons.code},
      {"name": "Estadística 2", "color": Colors.purple, "icon": Icons.bar_chart},
      {"name": "Química General", "color": Colors.red, "icon": Icons.bubble_chart},
      {"name": "Álgebra", "color": Colors.teal, "icon": Icons.calculate},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Sácate 100"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "📚 Tus materias este semestre",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: subjects.map((subject) {
                  return GestureDetector(
                    onTap: () {
                      // Aquí navegarías al detalle por docente
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Seleccionaste ${subject['name']}")),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (subject["color"] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: subject["color"], width: 1.5),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(subject["icon"], size: 40, color: subject["color"]),
                          const SizedBox(height: 12),
                          Text(
                            subject["name"],
                            style: TextStyle(
                              color: subject["color"],
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Próximamente: Chat con IA")),
          );
        },
        icon: const Icon(Icons.chat_bubble_outline),
        label: const Text("Habla con IA"),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}