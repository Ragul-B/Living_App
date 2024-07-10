import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController otpController = TextEditingController();

  bool _isOTPEmpty = false;
  bool _isOTPValid = true;

  void _submitOTP() {
    setState(() {
      _isOTPEmpty = otpController.text.isEmpty;
      _isOTPValid = RegExp(r'^[0-9]{6}$').hasMatch(otpController.text); // Check if OTP consists of exactly 6 digits
    });

    if (!_isOTPEmpty && _isOTPValid) {
      // Perform OTP validation logic

      // Navigate to the tips page after OTP submission
      Navigator.pushNamed(context, '/tips');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
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
                controller: otpController,
                keyboardType: TextInputType.number, // Set keyboard type to number
                maxLength: 6, // Set maximum length to 6
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                  hintText: 'Enter the OTP received',
                  errorText: _isOTPEmpty ? 'OTP is required' : (!_isOTPValid ? 'Invalid OTP' : null), // Show error for invalid OTP
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitOTP,
                child: Text('Submit OTP'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Add your logic to resend OTP here
                },
                child: Text('Resend OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
