// Suggested code may be subject to a license. Learn more: ~LicenseLog:2260269867.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:357931094.
import 'package:flutter/material.dart';

// ignore: camel_case_types
class RegisterScreen extends StatelessWidget {
  final String userName;

  const RegisterScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Text('Hello $userName!'),
      ),
    );
  }
}
