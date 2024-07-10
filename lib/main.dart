import 'package:flutter/material.dart';
import 'get_started_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'otp_page.dart';
import 'tips_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sustainable Living Assistant',
      theme: ThemeData(
        primarySwatch: Colors.green,
        hintColor: Colors.lightGreenAccent, // Use a specific accent color
        fontFamily: 'Vijaya',
      ),
      debugShowCheckedModeBanner: false, // Remove debug banner
      initialRoute: '/',
      routes: {
        '/': (context) => GetStartedPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/otp': (context) => OTPPage(),
        '/tips': (context) => TipsPage(),
      },
    );
  }
}
