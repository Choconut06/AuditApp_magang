import 'package:flutter/material.dart';

class AddPkatPage extends StatefulWidget {
  const AddPkatPage({super.key});

  @override
  State<AddPkatPage> createState() => _AddPkatPageState();
}

class _AddPkatPageState extends State<AddPkatPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> formData = {
    "nomor": "",
    "tahun": "",
    "pkat": "",
    "detail": "",
    "jumlah": "",
    "revisi": "",
    "status": "",
    "nomorRevisi": "",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah PKAT"),
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField("nomor", "Nomor"),
              _buildTextField("tahun", "Tahun"),
              _buildTextField("pkat", "PKAT"),
              _buildTextField("detail", "Detail Rencana"),
              _buildTextField("jumlah", "Jumlah"),
              _buildTextField("revisi", "Revisi"),
              _buildTextField("status", "Status Revisi"),
              _buildTextField("nomorRevisi", "Nomor Revisi"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, formData);
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
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$label tidak boleh kosong";
          }
          return null;
        },
        onChanged: (value) {
          formData[key] = value;
        },
      ),
    );
  }
}
