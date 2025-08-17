import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final _oldPass = TextEditingController();
  final _newPass = TextEditingController();
  final _confirmPass = TextEditingController();

  bool _showOld = false;
  bool _showNew = false;
  bool _showConfirm = false;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _oldPass.dispose();
    _newPass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }

  String? _basicValidator(String? v, {int min = 6}) {
    if (v == null || v.isEmpty) return 'Wajib diisi';
    if (v.length < min) return 'Minimal $min karakter';
    return null;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_newPass.text != _confirmPass.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Konfirmasi password tidak sama')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      // TODO: ganti dengan pemanggilan API/backend Anda.
      await Future.delayed(const Duration(milliseconds: 800));

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Password berhasil diubah')));
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal mengubah password: $e')));
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Colors.blue[400];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Password'),
        backgroundColor: primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Password Lama
              TextFormField(
                controller: _oldPass,
                obscureText: !_showOld,
                decoration: InputDecoration(
                  labelText: 'Password Lama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showOld ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => _showOld = !_showOld),
                  ),
                ),
                validator: (v) => _basicValidator(v),
              ),
              const SizedBox(height: 12),

              // Password Baru
              TextFormField(
                controller: _newPass,
                obscureText: !_showNew,
                decoration: InputDecoration(
                  labelText: 'Password Baru',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  helperText:
                      'Minimal 6 karakter, disarankan kombinasi huruf & angka',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showNew ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => _showNew = !_showNew),
                  ),
                ),
                validator: (v) => _basicValidator(v),
              ),
              const SizedBox(height: 12),

              // Konfirmasi Password
              TextFormField(
                controller: _confirmPass,
                obscureText: !_showConfirm,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showConfirm ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed:
                        () => setState(() => _showConfirm = !_showConfirm),
                  ),
                ),
                validator: (v) {
                  final base = _basicValidator(v);
                  if (base != null) return base;
                  if (v != _newPass.text)
                    return 'Konfirmasi tidak sama dengan password baru';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isSubmitting ? null : _submit,
                  icon: const Icon(Icons.save),
                  label: Text(_isSubmitting ? 'Menyimpan...' : 'Simpan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
