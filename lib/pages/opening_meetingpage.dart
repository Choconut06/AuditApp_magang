import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class OpeningMeetingPage extends StatelessWidget {
  const OpeningMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Opening Meeting')),
      body: const Center(child: Text('Halaman Opening Meeting')),
    );
  }
}
