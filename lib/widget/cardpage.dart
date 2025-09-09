import 'package:flutter/material.dart';

/// Data sederhana untuk chip meta (label: value)
class MetaChipData {
  final String label;
  final String value;
  const MetaChipData(this.label, this.value);
}

/// Card universal untuk semua modul (PKAT, Investigasi, Pelaporan, dst.)
class UniversalAuditCard extends StatelessWidget {
  final String title;
  final String status;
  final String? subtitle;
  final List<MetaChipData> chips;

  /// Interaksi
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  /// Tampilan
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final bool showDividerBeforeActions;

  const UniversalAuditCard({
    super.key,
    required this.title,
    required this.status,
    required this.chips,
    this.subtitle,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.padding = const EdgeInsets.all(14),
    this.borderRadius = 16,
    this.showDividerBeforeActions = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color badgeColor = _universalStatusColor(status);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueGrey.shade100),
        borderRadius: BorderRadius.circular(borderRadius),
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
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap ?? onEdit,
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: title + status badge
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
                        color: badgeColor.withOpacity(0.12),
                        border: Border.all(color: badgeColor.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: badgeColor,
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

                if (chips.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children:
                        chips.map((c) => _metaChip(c.label, c.value)).toList(),
                  ),
                ],

                if (showDividerBeforeActions &&
                    (onEdit != null || onDelete != null)) ...[
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                ],

                if (onEdit != null || onDelete != null) ...[
                  Row(
                    children: [
                      if (onEdit != null)
                        TextButton.icon(
                          onPressed: onEdit,
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          label: const Text("Edit"),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.orange,
                          ),
                        ),
                      if (onDelete != null) const SizedBox(width: 8),
                      if (onDelete != null)
                        TextButton.icon(
                          onPressed: onDelete,
                          icon: const Icon(Icons.delete, color: Colors.red),
                          label: const Text("Hapus"),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Chip builder
  Widget _metaChip(String label, String value) {
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
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey.shade700,
            ),
          ),
          Text(value, style: TextStyle(color: Colors.blueGrey.shade800)),
        ],
      ),
    );
  }

  /// Pemetaan warna status yang universal:
  /// - Merah:   ditolak
  /// - Amber:   draft/proses (proses, dalam proses, pending, aktif)
  /// - Hijau:   disetujui
  /// selain itu: blueGrey (default)
  Color _universalStatusColor(String s) {
    final t = s.trim().toLowerCase();

    // Hijau
    if (t == 'disetujui' ||
        t == 'approved' ||
        t == 'approve' ||
        t == 'selesai') {
      return Colors.green;
    }

    // Amber (draft/proses)
    if (t == 'draft' ||
        t == 'proses' ||
        t == 'dalam proses' ||
        t == 'pending' ||
        t == 'aktif' ||
        t == 'on progress' ||
        t == 'progress') {
      return Colors.amber;
    }

    // Merah
    if (t == 'ditolak' || t == 'rejected' || t == 'tolak') {
      return Colors.red;
    }

    // Default
    return Colors.blueGrey;
  }
}
