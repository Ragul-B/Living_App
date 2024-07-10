import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage widget

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isNameEmpty = false;
  bool _isEmailEmpty = false;
  bool _isPasswordEmpty = false;
  bool _isConfirmPasswordEmpty = false;

  void _signUp() {
    setState(() {
      _isNameEmpty = nameController.text.isEmpty;
      _isEmailEmpty = emailController.text.isEmpty;
      _isPasswordEmpty = passwordController.text.isEmpty;
      _isConfirmPasswordEmpty = confirmPasswordController.text.isEmpty;
    });

    if (!_isNameEmpty && !_isEmailEmpty && !_isPasswordEmpty && !_isConfirmPasswordEmpty) {
      // Perform sign-up logic

      // Navigate to the login page after sign-up
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  void _continueWithGoogle() {
    // Implement sign-up with Google logic
  }

  void _continueWithFacebook() {
    // Implement sign-up with Facebook logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  errorText: _isNameEmpty ? 'Name is required' : null,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  errorText: _isEmailEmpty ? 'Email is required' : null,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  errorText: _isPasswordEmpty ? 'Password is required' : null,
                ),
                obscureText: true, // Hide the entered text
              ),
              SizedBox(height: 16),
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                  errorText: _isConfirmPasswordEmpty ? 'Confirm Password is required' : null,
                ),
                obscureText: true, // Hide the entered text
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _signUp,
                child: Text('Sign Up'),
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: _continueWithGoogle,
                icon: Icon(Icons.account_circle_outlined), // Google icon
                label: Text('Continue with Google'),
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: _continueWithFacebook,
                icon: Icon(Icons.facebook), // Facebook icon
                label: Text('Continue with Facebook'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
