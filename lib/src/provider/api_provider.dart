import 'dart:convert';

import 'package:http/http.dart';

class ApiProvider {
  final String _baseUrl = 'https://84e1-122-179-159-67.ngrok-free.app/';
  final String _login = 'api/v1/user/login';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final Response response = await post(
      Uri.parse('$_baseUrl$_login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Successfully logged in
      return jsonDecode(response.body);
    } else {
      // Handle errors
      final responseBody = jsonDecode(response.body);
      throw Exception(responseBody['message'] ?? 'Login failed');
    }
  }
}
