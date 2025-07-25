import 'package:flutter/material.dart';

class PenilaianResikoPage extends StatelessWidget {
  const PenilaianResikoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penilaian Resiko'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
    );
  }
}