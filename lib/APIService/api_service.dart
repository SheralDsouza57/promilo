import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://apiv2stg.promilo.com';

  Future<http.Response> login(String email, String password) async {
    // Convert password to SHA256
    final bytes = utf8.encode(password);
    final hashedPassword = sha256.convert(bytes).toString();

    // Creating form data
    final body = {
      'username': email,
      'password': hashedPassword,
      'grant_type': 'password',
    };

    final response = await http.post(
      Uri.parse('$_baseUrl/user/oauth/token'),
      headers: {
        'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    return response;
  }
}
