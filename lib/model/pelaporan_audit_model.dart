class SuratKesediaanItem {
  final int nomor;
  final String tahun;
  final String objekAudit;
  final String suratTugas;
  final String surat;
  final String auditor;
  final String rev;
  final String status;
  final String kode;

  SuratKesediaanItem({
    required this.nomor,
    required this.tahun,
    required this.objekAudit,
    required this.suratTugas,
    required this.surat,
    required this.auditor,
    required this.rev,
    required this.status,
    required this.kode,
  });

  static List<SuratKesediaanItem> seed() => [
    SuratKesediaanItem(
      nomor: 1,
      tahun: "2025",
      objekAudit: "Cabang Bandung",
      suratTugas: "ST-001/2025",
      surat: "SK-001/2025",
      auditor: "Tim A",
      rev: "0",
      status: "Disetujui",
      kode: "SKS001",
    ),
  ];

  factory SuratKesediaanItem.fromMap(Map<String, dynamic> m) {
    return SuratKesediaanItem(
      nomor:
          m["nomor"] is int ? m["nomor"] : int.tryParse("${m["nomor"]}") ?? 0,
      tahun: m["tahun"] ?? "-",
      objekAudit: m["objekAudit"] ?? "-",
      suratTugas: m["suratTugas"] ?? "-",
      surat: m["surat"] ?? "-",
      auditor: m["auditor"] ?? "-",
      rev: m["rev"] ?? "-",
      status: m["status"] ?? "-",
      kode: m["#"] ?? m["kode"] ?? "-",
    );
  }
}

class ExecutiveSummaryItem {
  final int nomor;
  final String tahun;
  final String objekAudit;
  final String suratTugas;
  final String memo;
  final String auditor;
  final String rev;
  final String status;
  final String kode;

  ExecutiveSummaryItem({
    required this.nomor,
    required this.tahun,
    required this.objekAudit,
    required this.suratTugas,
    required this.memo,
    required this.auditor,
    required this.rev,
    required this.status,
    required this.kode,
  });

  static List<ExecutiveSummaryItem> seed() => [
    ExecutiveSummaryItem(
      nomor: 1,
      tahun: "2025",
      objekAudit: "Keuangan Pusat",
      suratTugas: "ST-002/2025",
      memo: "EXE-MEMO-001",
      auditor: "Tim B",
      rev: "1",
      status: "Draft",
      kode: "ES001",
    ),
  ];

  factory ExecutiveSummaryItem.fromMap(Map<String, dynamic> m) {
    return ExecutiveSummaryItem(
      nomor:
          m["nomor"] is int ? m["nomor"] : int.tryParse("${m["nomor"]}") ?? 0,
      tahun: m["tahun"] ?? "-",
      objekAudit: m["objekAudit"] ?? "-",
      suratTugas: m["suratTugas"] ?? "-",
      memo: m["memo"] ?? "-",
      auditor: m["auditor"] ?? "-",
      rev: m["rev"] ?? "-",
      status: m["status"] ?? "-",
      kode: m["#"] ?? m["kode"] ?? "-",
    );
  }
}

class LhpItem {
  final int nomor;
  final String tahun;
  final String objekAudit;
  final String suratTugas;
  final String lhp;
  final String auditor;
  final String rev;
  final String status;
  final String kode;

  LhpItem({
    required this.nomor,
    required this.tahun,
    required this.objekAudit,
    required this.suratTugas,
    required this.lhp,
    required this.auditor,
    required this.rev,
    required this.status,
    required this.kode,
  });

  static List<LhpItem> seed() => [
    LhpItem(
      nomor: 1,
      tahun: "2025",
      objekAudit: "Operasional Gudang",
      suratTugas: "ST-003/2025",
      lhp: "LHP-001/2025",
      auditor: "Tim C",
      rev: "0",
      status: "Selesai",
      kode: "LHP001",
    ),
  ];

  factory LhpItem.fromMap(Map<String, dynamic> m) {
    return LhpItem(
      nomor:
          m["nomor"] is int ? m["nomor"] : int.tryParse("${m["nomor"]}") ?? 0,
      tahun: m["tahun"] ?? "-",
      objekAudit: m["objekAudit"] ?? "-",
      suratTugas: m["suratTugas"] ?? "-",
      lhp: m["LHP"] ?? m["lhp"] ?? "-",
      auditor: m["auditor"] ?? "-",
      rev: m["rev"] ?? "-",
      status: m["status"] ?? "-",
      kode: m["#"] ?? m["kode"] ?? "-",
    );
  }
}

class RealisasiBiayaPelaporanItem {
  final int nomor;
  final String tahun;
  final String objekAudit;
  final String lhp;
  final String auditor;
  final String rev;
  final String status;
  final String kode;

  RealisasiBiayaPelaporanItem({
    required this.nomor,
    required this.tahun,
    required this.objekAudit,
    required this.lhp,
    required this.auditor,
    required this.rev,
    required this.status,
    required this.kode,
  });

  static List<RealisasiBiayaPelaporanItem> seed() => [
    RealisasiBiayaPelaporanItem(
      nomor: 1,
      tahun: "2025",
      objekAudit: "Distribusi Regional",
      lhp: "LHP-001/2025",
      auditor: "Tim D",
      rev: "2",
      status: "Disetujui",
      kode: "RB-LHP-001",
    ),
  ];

  factory RealisasiBiayaPelaporanItem.fromMap(Map<String, dynamic> m) {
    return RealisasiBiayaPelaporanItem(
      nomor:
          m["nomor"] is int ? m["nomor"] : int.tryParse("${m["nomor"]}") ?? 0,
      tahun: m["tahun"] ?? "-",
      objekAudit: m["objekAudit"] ?? "-",
      lhp: m["LHP"] ?? m["lhp"] ?? "-",
      auditor: m["auditor"] ?? "-",
      rev: m["rev"] ?? "-",
      status: m["status"] ?? "-",
      kode: m["#"] ?? m["kode"] ?? "-",
    );
  }
}
