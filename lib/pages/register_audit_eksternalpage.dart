import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class RegisterAuditEksternalpage extends StatelessWidget {
  const RegisterAuditEksternalpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Register Audit Eksternal')),
      body: const Center(child: Text('Register Audit Eksternal')),
    );
  }
}
