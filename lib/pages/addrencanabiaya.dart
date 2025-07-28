import 'package:flutter/material.dart';

class AddRencanaBiayaPage extends StatefulWidget {
  const AddRencanaBiayaPage({super.key});

  @override
  State<AddRencanaBiayaPage> createState() => _AddRencanaBiayaPageState();
}

class _AddRencanaBiayaPageState extends State<AddRencanaBiayaPage> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> formData = {
    "Nomor": "",
    "Tahun": "",
    "PKAT": "",
    "Total Biaya": "",
    "Revisi": "",
    "Status Revisi": "",
    "Nomor Revisi": "",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Rencana Biaya"),
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
              _buildTextField("kegiatan", "Nama Kegiatan"),
              _buildTextField("detail", "Detail Biaya"),
              _buildTextField("jumlah", "Jumlah Biaya"),
              _buildTextField("sumber", "Sumber Dana"),
              _buildTextField("status", "Status Pengajuan"),
              _buildTextField("referensi", "Nomor Referensi"),
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
