import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddRegisterPage extends StatefulWidget {
  const AddRegisterPage({super.key});

  @override
  State<AddRegisterPage> createState() => _AddRegisterPageState();
}

class _AddRegisterPageState extends State<AddRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> form = {
    "nomor": "",
    "lhp": "",
    "instansi": "",
    "periode": "",
    "jumlahTemuan": "",
    "rev": "",
    "status": "",
    "#": "",
  };
  final _statusOptions = const ["Selesai", "Proses", "Draft"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Register")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _numberField("nomor", "Nomor"),
              _textField("lhp", "LHP"),
              _textField("instansi", "Instansi Pemeriksa"),
              _textField("periode", "Periode Pemeriksaan"),
              _numberField("jumlahTemuan", "Jumlah Temuan"),
              _textField("rev", "Rev"),
              _dropdownField("status", "Status", _statusOptions),
              _textField("#", "# (Kode Dokumen)"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, form);
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

  Widget _textField(String key, String label) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator:
          (v) => v == null || v.trim().isEmpty ? "Tidak boleh kosong" : null,
      onChanged: (v) => form[key] = v.trim(),
    ),
  );

  Widget _numberField(String key, String label) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (v) => v == null || v.isEmpty ? "Tidak boleh kosong" : null,
      onChanged: (v) => form[key] = v.trim(),
    ),
  );

  Widget _dropdownField(String key, String label, List<String> options) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          items:
              options
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
          onChanged: (v) => form[key] = v ?? "",
          validator: (v) => v == null || v.isEmpty ? "Pilih salah satu" : null,
        ),
      );
}
