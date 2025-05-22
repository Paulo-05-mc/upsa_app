import 'package:upsa_app/models/user.dart';

class AppUser {
  final String name;
  final String email;
  final bool isPremium;

  AppUser({
    required this.name,
    required this.email,
    this.isPremium = false,
  });

  factory AppUser.fromUser(User user) {
    return AppUser(
      name: user.name,
      email: user.email,
      isPremium: user.isPremium,
    );
  }
}