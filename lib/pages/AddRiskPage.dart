import 'package:flutter/material.dart';

class AddRiskPage extends StatefulWidget {
  const AddRiskPage({super.key});

  @override
  State<AddRiskPage> createState() => _AddRiskPageState();
}

class _AddRiskPageState extends State<AddRiskPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> newRisk = {
    "nomor": "",
    "periode": "",
    "jenis": "",
    "objek": "",
    "sasaran": "",
    "reverensi": "",
    "status": "",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Risiko Audit")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField("nomor", "Nomor"),
              _buildTextField("periode", "Periode"),
              _buildTextField("jenis", "Jenis Audit"),
              _buildTextField("objek", "Objek Audit"),
              _buildTextField("sasaran", "Sasaran"),
              _buildTextField("reverensi", "Reverensi"),
              _buildTextField("status", "Status"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, newRisk);
                  }
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String key, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator:
            (value) =>
                value == null || value.isEmpty ? "Tidak boleh kosong" : null,
        onChanged: (value) {
          newRisk[key] = value;
        },
      ),
    );
  }
}
