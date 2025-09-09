import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static const String _baseUrl = 'https://your-api-domain.com/api';
  static const _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  static Future<String?> getToken() async {
    return _storage.read(key: 'auth_token');
  }

  static Future<void> clearToken() async {
    await _storage.delete(key: 'auth_token');
  }

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/login');

    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final token = data['token'] as String;
      await saveToken(token);
      return data; // berisi token & user
    } else {
      String message = 'Login gagal';
      try {
        final err = jsonDecode(res.body);
        if (err is Map && err['message'] != null) message = err['message'];
      } catch (_) {}
      throw Exception(message);
    }
  }

  static Future<http.Response> authedGet(String path) async {
    final token = await getToken();
    final url = Uri.parse('$_baseUrl$path');
    return http.get(
      url,
      headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );
  }

  static Future<void> logout() async {
    final token = await getToken();
    if (token != null) {
      final url = Uri.parse('$_baseUrl/logout');
      await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
    }
    await clearToken();
  }
}
