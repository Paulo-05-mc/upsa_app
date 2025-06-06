import 'package:upsa_app/models/user.dart';

class AppUser extends User {
  final String name;
  final String email;
  final bool isPremium;

  AppUser({
    required this.name,
    required this.email,
    required this.isPremium,
  }) : super(
          id: '',
          email: email,
          name: name,
        );

  factory AppUser.fromUser(User user) {
    return AppUser(
      name: user.name,
      email: user.email,
      isPremium: user.isPremium,
    );
  }
}