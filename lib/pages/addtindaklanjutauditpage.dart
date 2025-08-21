import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTindakLanjutPage extends StatefulWidget {
  const AddTindakLanjutPage({super.key});

  @override
  State<AddTindakLanjutPage> createState() => _AddTindakLanjutPageState();
}

class _AddTindakLanjutPageState extends State<AddTindakLanjutPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> form = {
    "nomor": "",
    "idTemuan": "",
    "ringkasan": "",
    "tanggapan": "",
    "prosentase": "",
    "batasWaktu": "",
    "penyelesaian": "",
    "rev": "",
    "status": "",
    "#": "",
  };
  final _statusOptions = const ["Proses", "Selesai", "Tertunda"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Tindak Lanjut")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _numberField("nomor", "Nomor"),
              _textField("idTemuan", "ID Temuan"),
              _multilineField("ringkasan", "Ringkasan Temuan"),
              _multilineField("tanggapan", "Tanggapan/Komitmen Perbaikan"),
              _numberField("prosentase", "Prosentase (0–100)"),
              _textField("batasWaktu", "Batas Waktu (DD-MM-YYYY)"),
              _multilineField("penyelesaian", "Penyelesaian"),
              _textField("rev", "Rev"),
              _dropdownField("status", "Status", _statusOptions),
              _textField("#", "# (Kode Dokumen)"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Validasi tambahan prosentase 0–100 (opsional)
                    final p = int.tryParse(form["prosentase"] ?? "");
                    if (p == null || p < 0 || p > 100) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Prosentase harus 0–100")),
                      );
                      return;
                    }
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

  Widget _multilineField(String key, String label) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      maxLines: 3,
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
