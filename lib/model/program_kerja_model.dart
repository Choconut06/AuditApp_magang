import 'package:flutter/material.dart';

enum ProgramKerjaType { pkat, dokumenPkat, rencanaBiaya }

class ProgramKerjaItem {
  final ProgramKerjaType type;

  // Common
  final int nomor;
  final String tahun;
  final String status;
  final String revisi;
  final String noRevisi;

  // PKAT
  final String? pkat;
  final String? detail;
  final String? jumlah;

  // Dokumen PKAT
  final String? noPkat;
  final String? tglPkat;

  // Rencana Biaya
  final String? total;

  ProgramKerjaItem({
    required this.type,
    required this.nomor,
    required this.tahun,
    required this.status,
    required this.revisi,
    required this.noRevisi,
    this.pkat,
    this.detail,
    this.jumlah,
    this.noPkat,
    this.tglPkat,
    this.total,
  });

  factory ProgramKerjaItem.pkatItem({
    required int nomor,
    required String tahun,
    required String pkat,
    required String detail,
    required String jumlah,
    required String revisi,
    required String status,
    required String noRevisi,
  }) {
    return ProgramKerjaItem(
      type: ProgramKerjaType.pkat,
      nomor: nomor,
      tahun: tahun,
      pkat: pkat,
      detail: detail,
      jumlah: jumlah,
      revisi: revisi,
      status: status,
      noRevisi: noRevisi,
    );
  }

  factory ProgramKerjaItem.dokumenPkatItem({
    required int nomor,
    required String tahun,
    required String noPkat,
    required String tglPkat,
    required String revisi,
    required String status,
    required String noRevisi,
  }) {
    return ProgramKerjaItem(
      type: ProgramKerjaType.dokumenPkat,
      nomor: nomor,
      tahun: tahun,
      noPkat: noPkat,
      tglPkat: tglPkat,
      revisi: revisi,
      status: status,
      noRevisi: noRevisi,
    );
  }

  factory ProgramKerjaItem.rencanaBiayaItem({
    required int nomor,
    required String tahun,
    required String pkat,
    required String total,
    required String revisi,
    required String status,
    required String noRevisi,
  }) {
    return ProgramKerjaItem(
      type: ProgramKerjaType.rencanaBiaya,
      nomor: nomor,
      tahun: tahun,
      pkat: pkat,
      total: total,
      revisi: revisi,
      status: status,
      noRevisi: noRevisi,
    );
  }

  String get title {
    switch (type) {
      case ProgramKerjaType.pkat:
        return pkat ?? '-';
      case ProgramKerjaType.dokumenPkat:
        return noPkat ?? '-';
      case ProgramKerjaType.rencanaBiaya:
        return pkat ?? '-';
    }
  }

  String get subtitle {
    switch (type) {
      case ProgramKerjaType.pkat:
        return (detail ?? '').isEmpty ? 'Detail tidak tersedia' : (detail!);
      case ProgramKerjaType.dokumenPkat:
        return 'Tanggal PKAT: ${tglPkat ?? '-'}';
      case ProgramKerjaType.rencanaBiaya:
        return 'Total Biaya: ${total ?? '-'}';
    }
  }

  List<MapEntry<String, String>> get metaEntries {
    switch (type) {
      case ProgramKerjaType.pkat:
        return [
          MapEntry('Tahun', tahun),
          MapEntry('Nomor', nomor.toString()),
          MapEntry('Jumlah', jumlah ?? '-'),
          MapEntry('Revisi', revisi),
          MapEntry('No. Revisi', noRevisi),
        ];
      case ProgramKerjaType.dokumenPkat:
        return [
          MapEntry('Tahun', tahun),
          MapEntry('Nomor', nomor.toString()),
          MapEntry('Revisi', revisi),
          MapEntry('Status', status),
          MapEntry('No. Revisi', noRevisi),
        ];
      case ProgramKerjaType.rencanaBiaya:
        return [
          MapEntry('Tahun', tahun),
          MapEntry('Nomor', nomor.toString()),
          MapEntry('Total', total ?? '-'),
          MapEntry('Revisi', revisi),
          MapEntry('No. Revisi', noRevisi),
        ];
    }
  }

  static Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'disetujui':
        return Colors.green;
      case 'ditolak':
        return Colors.red;
      case 'draft':
      case 'revisi':
        return Colors.orange;
      default:
        return Colors.blueGrey;
    }
  }

  static List<ProgramKerjaItem> samplePkat() => [
    ProgramKerjaItem.pkatItem(
      nomor: 1,
      tahun: '2025',
      pkat: 'PKAT-001',
      detail: 'Audit Keuangan Semester 1',
      jumlah: '20 Juta',
      revisi: '1',
      status: 'Disetujui',
      noRevisi: 'R001',
    ),
  ];

  static List<ProgramKerjaItem> sampleDokumenPkat() => [
    ProgramKerjaItem.dokumenPkatItem(
      nomor: 1,
      tahun: '2024',
      noPkat: 'PKAT-001',
      tglPkat: '01/07/2024',
      revisi: '1',
      status: 'Disetujui',
      noRevisi: 'DP001',
    ),
    ProgramKerjaItem.dokumenPkatItem(
      nomor: 2,
      tahun: '2025',
      noPkat: 'PKAT-002',
      tglPkat: '15/03/2025',
      revisi: '2',
      status: 'Revisi',
      noRevisi: 'DP002',
    ),
  ];

  static List<ProgramKerjaItem> sampleRencanaBiaya() => [
    ProgramKerjaItem.rencanaBiayaItem(
      nomor: 1,
      tahun: '2024',
      pkat: 'PKAT-001',
      total: '15 Juta',
      revisi: '1',
      status: 'Disetujui',
      noRevisi: 'RB001',
    ),
    ProgramKerjaItem.rencanaBiayaItem(
      nomor: 2,
      tahun: '2025',
      pkat: 'PKAT-002',
      total: '22 Juta',
      revisi: '2',
      status: 'Revisi',
      noRevisi: 'RB002',
    ),
  ];
}
