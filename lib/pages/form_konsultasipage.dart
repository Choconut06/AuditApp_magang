import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class FormKonsultasipage extends StatelessWidget {
  const FormKonsultasipage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Form Konsultasi')),
      body: const Center(child: Text('Form Konsultasi')),
    );
  }
}
