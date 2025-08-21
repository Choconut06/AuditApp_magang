import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddBuktiPermulaanPage extends StatefulWidget {
  const AddBuktiPermulaanPage({super.key});

  @override
  State<AddBuktiPermulaanPage> createState() => _AddBuktiPermulaanPageState();
}

class _AddBuktiPermulaanPageState extends State<AddBuktiPermulaanPage> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> newBukti = {
    "nomor": "",
    "tahun": "",
    "objekAudit": "",
    "buktiPermulaan": "",
    "rev": "",
    "status": "",
    "#": "",
  };

  final _statusOptions = const ["Dalam Proses", "Disetujui", "Ditolak"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Bukti Permulaan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildNumberField("nomor", "Nomor"),
              _buildYearField("tahun", "Tahun"),
              _buildTextField("objekAudit", "Objek Audit"),
              _buildMultilineField("buktiPermulaan", "Bukti Permulaan"),
              _buildNumberField("rev", "Revisi (Rev)"),
              _buildStatusDropdown(),
              _buildTextField("#", "# (Kode)"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, newBukti);
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

  // ====== FIELD BUILDERS ======

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
                value == null || value.trim().isEmpty
                    ? "Tidak boleh kosong"
                    : null,
        onChanged: (value) => newBukti[key] = value.trim(),
      ),
    );
  }

  Widget _buildMultilineField(String key, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        maxLines: 3,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
          border: const OutlineInputBorder(),
        ),
        validator:
            (value) =>
                value == null || value.trim().isEmpty
                    ? "Tidak boleh kosong"
                    : null,
        onChanged: (value) => newBukti[key] = value.trim(),
      ),
    );
  }

  Widget _buildNumberField(String key, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Tidak boleh kosong";
          }
          if (int.tryParse(value.trim()) == null) {
            return "Harus berupa angka";
          }
          return null;
        },
        onChanged: (value) => newBukti[key] = value.trim(),
      ),
    );
  }

  Widget _buildYearField(String key, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Tidak boleh kosong";
          }
          final year = int.tryParse(value.trim());
          if (year == null || year < 1900 || year > 2100) {
            return "Tahun tidak valid";
          }
          return null;
        },
        onChanged: (value) => newBukti[key] = value.trim(),
      ),
    );
  }

  Widget _buildStatusDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: "Status",
          border: OutlineInputBorder(),
        ),
        items:
            _statusOptions
                .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                .toList(),
        onChanged: (val) => newBukti["status"] = val ?? "",
        validator:
            (val) =>
                (val == null || val.isEmpty) ? "Pilih salah satu status" : null,
      ),
    );
  }
}
