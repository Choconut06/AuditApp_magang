import 'package:flutter/material.dart';
import 'package:audit_app_magang/widget/sidebar.dart';

class ReviewDraftLHAPage extends StatelessWidget {
  const ReviewDraftLHAPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Review Draft LHA')),
      body: const Center(child: Text('Halaman Review Draft LHA')),
    );
  }
}
