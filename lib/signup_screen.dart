import 'package:flutter/material.dart';
import 'package:intership_cycle_two/user_profile_wrapper.dart';
import 'auth_services.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _auth = AuthService();

  SignupScreen({super.key});

  void _signup(BuildContext context) async {
    final error = await _auth.signUp(
      nameController.text,
      emailController.text,
      passwordController.text,
    );

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UserProfileWrapper()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => _signup(context), child: Text("Sign up")),
          ],
        ),
      ),
    );
  }
}
