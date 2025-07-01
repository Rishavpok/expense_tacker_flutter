class Registration {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String username;
  final String password;

  Registration({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
    };
  }
}
