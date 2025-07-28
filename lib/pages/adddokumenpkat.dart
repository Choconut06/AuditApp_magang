import 'package:flutter/material.dart';

class AddDokumenPkatPage extends StatefulWidget {
  const AddDokumenPkatPage({super.key});

  @override
  State<AddDokumenPkatPage> createState() => _AddDokumenPkatPageState();
}

class _AddDokumenPkatPageState extends State<AddDokumenPkatPage> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> formData = {
    "nomor": "",
    "tahun": "",
    "nomorPKAT": "",
    "tanggalPKAT": "",
    "revisi": "",
    "statusRevisi": "",
    "nomorRevisi": "",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Dokumen PKAT"),
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
              _buildTextField("nomorPKAT", "Nomor PKAT"),
              _buildTextField("tanggalPKAT", "Tanggal PKAT"),
              _buildTextField("revisi", "Revisi"),
              _buildTextField("statusRevisi", "Status Revisi"),
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
