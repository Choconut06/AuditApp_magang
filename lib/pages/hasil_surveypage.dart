import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class HasilSurveypage extends StatelessWidget {
  const HasilSurveypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Hasil Survey')),
      body: const Center(child: Text('Hasil Survey')),
    );
  }
}
