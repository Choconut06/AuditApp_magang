import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class LHPPage extends StatelessWidget {
  const LHPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('LHP')),
      body: const Center(child: Text('LHP')),
    );
  }
}
