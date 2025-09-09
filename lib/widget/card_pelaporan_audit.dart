import 'package:flutter/material.dart';

class PelaporanChip {
  final String label;
  final String value;
  const PelaporanChip(this.label, this.value);
}

class PelaporanCard extends StatelessWidget {
  final String
  title; // judul utama (mis: SK-001/2025, EXE-MEMO-001, LHP-001/2025)
  final String status; // status
  final String? subtitle; // info singkat (mis: objek audit / auditor)
  final List<PelaporanChip> chips; // meta fields
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final Color Function(String status)? statusColorResolver;

  const PelaporanCard({
    super.key,
    required this.title,
    required this.status,
    required this.chips,
    this.subtitle,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.statusColorResolver,
  });

  @override
  Widget build(BuildContext context) {
    final color = (statusColorResolver ?? _defaultColor)(status);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueGrey.shade100),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap ?? onEdit,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.12),
                        border: Border.all(color: color.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),

                if (subtitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey.shade700,
                    ),
                  ),
                ],

                const SizedBox(height: 12),

                // Chips
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: chips.map(_chip).toList(),
                ),

                const SizedBox(height: 12),
                const Divider(height: 1),

                // Actions
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit, color: Colors.orange),
                      label: const Text("Edit"),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton.icon(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete, color: Colors.red),
                      label: const Text("Hapus"),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _chip(PelaporanChip c) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey.shade100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${c.label}: ",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey.shade700,
            ),
          ),
          Text(c.value, style: TextStyle(color: Colors.blueGrey.shade800)),
        ],
      ),
    );
  }

  Color _defaultColor(String s) {
    switch (s.toLowerCase()) {
      case 'disetujui':
        return Colors.green;
      case 'selesai':
        return Colors.teal;
      case 'draft':
        return Colors.orange;
      case 'ditolak':
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }
}
