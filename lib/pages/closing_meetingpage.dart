import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class ClosingMeetingPage extends StatelessWidget {
  const ClosingMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Closing Meeting')),
      body: const Center(child: Text('Halaman Closing Meeting')),
    );
  }
}
