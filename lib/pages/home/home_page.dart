import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../account/profile_page.dart';

class HomePage extends StatelessWidget {
  final AppUser user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Inicio", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black54),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfilePage(user: user)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Empieza",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _featureCard(
                  context,
                  title: "Encuentra un quiz",
                  icon: Icons.quiz_outlined,
                  color: Colors.lightBlueAccent,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Funcionalidad próximamente")),
                    );
                  },
                ),
                const SizedBox(width: 12),
                _featureCard(
                  context,
                  title: "Preguntar a la IA",
                  icon: Icons.camera_alt_outlined,
                  color: Colors.pinkAccent,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("IA integrada próximamente")),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Mis StudyLists",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _bigCard(
              context,
              title: "Mis favoritos",
              subtitle: "Pulsa para saber más",
              icon: Icons.favorite,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 24),
            const Text(
              "Seguir leyendo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _placeholderContent(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "IA"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Perfil"),
        ],
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfilePage(user: user)),
            );
          }
        },
      ),
    );
  }

  Widget _featureCard(BuildContext context,
      {required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bigCard(BuildContext context,
      {required String title, required String subtitle, required IconData icon, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28, color: color),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _placeholderContent(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text("Inicia sesión o regístrate para continuar donde lo dejaste"),
      ),
    );
  }
}