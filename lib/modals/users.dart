class Users {
  final String username;
  final String password;

  Users({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
