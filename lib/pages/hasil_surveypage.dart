import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class HasilSurveyPage extends StatelessWidget {
  const HasilSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Hasil Survey')),
      body: const Center(child: Text('Hasil Survey')),
    );
  }
}
