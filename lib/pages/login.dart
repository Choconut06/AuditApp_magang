import 'package:audit_app_magang/pages/homepage.dart';
import 'package:audit_app_magang/utility/config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            //Header
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  Image.asset('images/krakataulogo.png', height: 80),
                  const SizedBox(height: 8),
                  const Text(
                    'IAMS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Internal Audit Management System',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //card
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, -4)
                    )
                  ]
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Email / Username',
                        style: TextStyle( 
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 5,),
                      TextField(
                        controller: txtUsername,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Username / Email',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey)
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Password',
                        style: TextStyle( 
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      TextField(
                        controller: txtPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey)
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lupa Password?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          String username = txtUsername.text;
                          String password = txtPassword.text;
                          loginUser(context, username, password);
                          //loginUser
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade400,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                        child: const Text(
                          'Login'
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> loginUser(
  BuildContext context,
  String username,
  String password,
) async {
  // Validasi awal biar ga call API percuma
  final u = username.trim();
  if (u.isEmpty || password.isEmpty) {
    if (!context.mounted) return;
    await showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text('Login Gagal'),
        content: Text('Username/Email dan password wajib diisi.'),
      ),
    );
    return;
  }

  final url = Uri.parse('${Config.baseUrl}/api/login');

  // Kirim beberapa kemungkinan key agar cocok dengan backend kamu
  final body = <String, dynamic>{
    'login': u,
    'username': u,
    if (u.contains('@')) 'email': u,
    'password': password,
  };

  // Helper kecil untuk ambil pesan error Laravel
  String _extractErrorMessage(int code, Map<String, dynamic>? data) {
    if (data == null) {
      return code == 401
          ? 'Kredensial salah.'
          : 'Login gagal. Coba lagi.';
    }
    if (data['message'] is String && (data['message'] as String).isNotEmpty) {
      return data['message'].toString();
    }
    // Laravel validation: {"errors": {"field": ["msg", ...]}}
    final errors = data['errors'];
    if (errors is Map) {
      for (final v in errors.values) {
        if (v is List && v.isNotEmpty) return v.first.toString();
        if (v is String && v.isNotEmpty) return v;
      }
    }
    // Beberapa API pakai {"error": "..."}
    if (data['error'] is String && (data['error'] as String).isNotEmpty) {
      return data['error'].toString();
    }
    return code == 401 ? 'Kredensial salah.' : 'Login gagal. Coba lagi.';
  }

  try {
    final response = await http
        .post(
          url,
          headers: const {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 15));

    Map<String, dynamic>? data;
    try {
      data = jsonDecode(response.body) as Map<String, dynamic>?;
    } catch (_) {
      data = null; // non-JSON / HTML error, dll
    }

    if (!context.mounted) return;

    // ==== Sukses: terima 2xx dan ada token/user ====
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Pola 1 (Laravel Passport yang biasa kamu pakai)
      var token = data?['token'];
      var tokenType = (data?['token_type'] ?? 'Bearer').toString();
      var user = data?['user'];

      // Pola 2 (beberapa API nest di "data" + "status":"success")
      if ((token == null || user == null) && data?['data'] is Map) {
        final d = data!['data'] as Map;
        token ??= d['token'];
        tokenType = (d['token_type'] ?? tokenType).toString();
        user ??= d['user'];
      }

      // Terakhir, boleh juga cek "status":"success" (tanpa token—kurang ideal)
      final status = data?['status']?.toString().toLowerCase();
      final hasUserId = (user is Map) && user['id'] != null;

      if (token != null && hasUserId) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token.toString());
        await prefs.setString('token_type', tokenType);
        await prefs.setInt('user_id', (user['id'] as num).toInt());
        await prefs.setString('user', jsonEncode(user));

        // Feedback ringan saja (tanpa ubah tampilan)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login berhasil.')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()) 
        );
        return;
      } else if (status == 'success' && hasUserId) {
        // Jika API tidak mengirim token (jarang, tapi amankan)
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('user_id', (user['id'] as num).toInt());
        await prefs.setString('user', jsonEncode(user));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login berhasil.')),
        );
        return;
      }
      // Kalau 2xx tapi format tak sesuai
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Login Gagal'),
          content: Text(_extractErrorMessage(response.statusCode, data)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // ==== Gagal (4xx/5xx) ====
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Login Gagal'),
        content: Text(_extractErrorMessage(response.statusCode, data)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } catch (e) {
    debugPrint('Login error: $e');
    if (!context.mounted) return;
    await showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text('Error'),
        content: Text('Tidak bisa terhubung ke server. Periksa koneksi Anda.'),
      ),
    );
  }
}
