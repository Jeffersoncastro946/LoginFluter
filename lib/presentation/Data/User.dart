// Definimos una clase User
class User {
  String name;
  String email;
  String phone;
  String password;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });
}

// Lista global para almacenar los usuarios
List<User> users = [];
