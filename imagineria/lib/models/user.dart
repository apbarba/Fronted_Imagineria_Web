
class User {
  final String name;
  final String email;
  final String accessToken;
  final String? avatar;
  final String? username;

  User({required this.name, required this.email, required this.accessToken, this.avatar, required this.username});

  @override
  String toString() => 'User { name: $name, email: $email}';
}


