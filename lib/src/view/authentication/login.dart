import 'package:crm/src/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:crm/src/constant/constant.dart';
import 'package:crm/src/widget/textfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final ApiProvider _apiProvider =
      ApiProvider(); // Create an instance of ApiProvider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Login Form
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Login to your account',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Enter your credentials to access your account',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email Address'),
                          const SizedBox(height: 8),
                          MyFormField(
                            controller: _email,
                            hintText: 'example@mail.com',
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Please enter email address';
                              } else if (!value!.trim().isEmail) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          const Text('Password'),
                          const SizedBox(height: 8),
                          MyFormField(
                            controller: _password,
                            hintText: '********',
                            obscureText: true,
                            maxLines: 1,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Please enter password';
                              } else if (!value!.trim().isPasswordEasy) {
                                return 'Please enter minimum 8 characters & cannot contain spaces';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 40),
                          Center(
                            child: SizedBox(
                              height: 50,
                              width: double
                                  .infinity, // Makes the button width same as text fields
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical:
                                          16), // Adjust vertical padding if needed
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: _onLogin,
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Image Side
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/login.jpg',
              fit: BoxFit.contain,
              height: double.infinity, // Ensure the image takes full height
              width: double.infinity, // Ensure the image takes full width
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onLogin() async {
    if (_formKey.currentState!.validate()) {
      // Perform login action
      final email = _email.text.trim();
      final password = _password.text.trim();

      try {
        final response = await _apiProvider.login(email, password);
        if (response['success']) {
          // Navigate to the next screen or show a success message
          // Navigator.pushNamed(
          //     context, '/home'); // Example of navigation to a home screen
        } else {
          // Show error message from API response
          _showToast('Please check your credentials and try again');
        }
      } catch (e) {
        // Show error message from exception
        _showToast('Please check your credentials and try again');
        print('Login failed: $e');
      }
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
