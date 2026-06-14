class UserEntity {
  final String id;
  final String? email;
  final String? fullName;
  final String? avatarUrl;
  final bool isNewUser; // Useful for first-time OAuth

  UserEntity({
    required this.id,
    this.email,
    this.fullName,
    this.avatarUrl,
    this.isNewUser = false,
  });
}
