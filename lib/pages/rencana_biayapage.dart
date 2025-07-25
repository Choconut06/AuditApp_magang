import 'package:flutter/material.dart';

class RencanaBiayaPage extends StatelessWidget {
  const RencanaBiayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rencana Biaya'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
    );
  }
}