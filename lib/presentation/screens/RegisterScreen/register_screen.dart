import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/presentation/Data/User.dart'; // Asegúrate de importar la lista global

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // ... (Validadores de campos)

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    if (value.length > 10) {
      return 'Name must be at most 10 characters long';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    if (!value.endsWith('.edu.hn')) {
      return 'Email must end with .edu.hn';
    }
    if (value.split('@').length != 2) {
      return 'Email must contain exactly one @';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length != 8) {
      return 'Phone number must be exactly 8 digits long';
    }
    if (!value.startsWith('3') && !value.startsWith('9')) {
      return 'Phone number must start with 3 or 9';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    final uppercaseRegex = RegExp(r'[A-Z]');
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!uppercaseRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!specialCharRegex.hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (Diseño de la pantalla)

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade800,
              Colors.blue.shade400,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.person_add,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                            width: 10), // Espacio entre el icono y el texto
                        Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Create your account",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 60),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: _validateName,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: _validateEmail,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _phoneController,
                              decoration: const InputDecoration(
                                hintText: "Phone",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: _validatePhone,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: _validatePassword,
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: _validateConfirmPassword,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Crear un nuevo usuario y añadirlo a la lista
                            User newUser = User(
                              name: _nameController.text,
                              email: _emailController.text,
                              phone: _phoneController.text,
                              password: _passwordController.text,
                            );
                            users.add(newUser);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Registration Successful')),
                            );

                            // Navegar a la pantalla de login
                            Navigator.pop(context);
                          }
                        },
                        height: 50,
                        color: Colors.orange[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Colors.grey,
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
