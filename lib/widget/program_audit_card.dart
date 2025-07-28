import 'package:flutter/material.dart';
import 'package:audit_app_magang/model/persiapan_audit_model.dart';

class ProgramAuditCard extends StatefulWidget {
  final ProgramAuditModel item;

  const ProgramAuditCard({Key? key, required this.item}) : super(key: key);

  @override
  State<ProgramAuditCard> createState() => _ProgramAuditCardState();
}

class _ProgramAuditCardState extends State<ProgramAuditCard> {
  Color _getStatusColor(int code) {
    switch (code) {
      case 0:
        return const Color.fromARGB(255, 255, 88, 88).withOpacity(0.3);
      case 2:
        return const Color.fromARGB(255, 255, 163, 88).withOpacity(0.3);
      default:
        return const Color.fromARGB(255, 88, 255, 124).withOpacity(0.3);
    }
  }

  Color _getTextColor(int code) {
    switch (code) {
      case 0:
        return const Color.fromARGB(255, 126, 0, 0);
      case 2:
        return const Color.fromARGB(255, 126, 76, 0);
      default:
        return const Color.fromARGB(255, 0, 126, 6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.blueGrey.shade400.withOpacity(0.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              ),
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Tahun", style: TextStyle(fontSize: 12)),
                        Text(widget.item.tahun, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 32,
                      width: 60,
                      decoration: BoxDecoration(
                        color: _getStatusColor(widget.item.statusCode),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.item.status,
                        style: TextStyle(
                          color: _getTextColor(widget.item.statusCode),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Objek Audit: ${widget.item.objekAudit}", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text("Surat Tugas: ${widget.item.suratTugas}", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text("Auditor: ${widget.item.auditor}", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text("Rev: ${widget.item.rev}", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.access_time, color: Colors.grey[600]), onPressed: () {}),
                IconButton(icon: Icon(Icons.account_circle, color: Colors.grey[600]), onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
