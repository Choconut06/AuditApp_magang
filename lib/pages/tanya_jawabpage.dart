import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class TanyaJawabpage extends StatelessWidget {
  const TanyaJawabpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Tanya Jawab')),
      body: const Center(child: Text('Tanya Jawab')),
    );
  }
}
