import 'package:apiflutter/pages/auth/register_screen.dart';
import 'package:apiflutter/pages/home_screen.dart';
import 'package:apiflutter/pages/menu_screen.dart';
import 'package:apiflutter/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email')),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true),
            ElevatedButton(
              onPressed: () async {
                bool success = await _authService.login(
                  password: passwordController.text,
                  email: emailController.text,
                );
                if (success) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => MenuScreen()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Login gagal')));
                }
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterScreen())),
              child: Text("Belum punya akun? Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
