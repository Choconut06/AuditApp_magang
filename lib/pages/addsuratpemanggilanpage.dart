import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddSuratPemanggilanPage extends StatefulWidget {
  const AddSuratPemanggilanPage({super.key});

  @override
  State<AddSuratPemanggilanPage> createState() =>
      _AddSuratPemanggilanPageState();
}

class _AddSuratPemanggilanPageState extends State<AddSuratPemanggilanPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> form = {
    "nomor": "",
    "tahun": "",
    "buktiPermulaan": "",
    "suratPemanggilan": "",
    "auditor": "",
    "rev": "",
    "status": "",
    "#": "",
  };
  final _statusOptions = const ["Terkirim", "Draft", "Dibatalkan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Surat Pemanggilan")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _numberField("nomor", "Nomor"),
              _yearField("tahun", "Tahun"),
              _textField("buktiPermulaan", "Bukti Permulaan (#/Kode)"),
              _textField("suratPemanggilan", "No/Ref Surat Pemanggilan"),
              _textField("auditor", "Auditor"),
              _numberField("rev", "Rev"),
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

  Widget _yearField(String key, String label) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
      ],
      decoration: InputDecoration(
        labelText: label,
        hintText: "YYYY",
        border: const OutlineInputBorder(),
      ),
      validator: (v) {
        if (v == null || v.trim().isEmpty) return "Tidak boleh kosong";
        final year = int.tryParse(v);
        if (year == null || year < 1900 || year > 2100)
          return "Tahun tidak valid";
        return null;
      },
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
