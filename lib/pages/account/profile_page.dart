import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import '../../models/AppUser.dart';


class ProfilePage extends StatelessWidget {
  final AppUser user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Mi Perfil", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.deepPurple,
              child: Text(
                user.name[0].toUpperCase(),
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            Text(user.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(user.email, style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 12),
            Chip(
              label: Text(user.isPremium ? "Premium" : "Gratis"),
              backgroundColor: user.isPremium ? Colors.amber[200] : Colors.grey[300],
              avatar: Icon(
                user.isPremium ? Icons.star : Icons.person_outline,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 30),

            // FAVORITOS
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              tileColor: Colors.white,
              leading: const Icon(Icons.favorite_border, color: Colors.deepPurple),
              title: const Text("Mis favoritos"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Próximamente")),
                );
              },
            ),
            const SizedBox(height: 12),

            // CAMBIAR CARRERA
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              tileColor: Colors.white,
              leading: const Icon(Icons.school_outlined, color: Colors.deepPurple),
              title: const Text("Cambiar carrera"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Función en desarrollo")),
                );
              },
            ),
            const SizedBox(height: 12),

            // CERRAR SESIÓN
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              tileColor: Colors.white,
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text("Cerrar sesión", style: TextStyle(color: Colors.redAccent)),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}