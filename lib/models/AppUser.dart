class AppUser {
  final String name;
  final String email;
  final bool isPremium;

  AppUser({
    required this.name,
    required this.email,
    this.isPremium = false,
  });
}