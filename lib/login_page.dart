import 'package:flutter/material.dart';
import 'signup_page.dart'; // Import the SignUpPage widget

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isEmailValid = true; // Initially set to true to avoid showing error on app launch
  bool _isPasswordValid = true; // Initially set to true to avoid showing error on app launch

  void _login() {
    setState(() {
      _isEmailValid = emailController.text.contains('@'); // Check for '@' symbol
      _isPasswordValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#$&*])(?=.*?[0-9]).{8,}$').hasMatch(passwordController.text); // Check for uppercase, special character, and length
    });

    if (_isEmailValid && _isPasswordValid) {
      // Perform login logic

      // Navigate to the OTP page
      Navigator.pushNamed(context, '/otp');
    }
  }

  void _navigateToSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())); // Navigate to the SignUpPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreenAccent,
              Colors.green, // Bottom color
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  errorText: _isEmailValid ? null : 'Email must contain "@" symbol',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  errorText: _isPasswordValid ? null : 'Format:1 uppercase, 1 special character, and must be 8 characters',
                ),
                obscureText: true, // Hide the entered text
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: _navigateToSignUp,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
