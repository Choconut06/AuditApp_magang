class BuktiPermulaanItem {
  final int nomor;
  final String tahun;
  final String objekAudit;
  final String buktiPermulaan;
  final String rev;
  final String status;
  final String kode; // mapping dari "#"

  BuktiPermulaanItem({
    required this.nomor,
    required this.tahun,
    required this.objekAudit,
    required this.buktiPermulaan,
    required this.rev,
    required this.status,
    required this.kode,
  });

  static List<BuktiPermulaanItem> seed() => [
    BuktiPermulaanItem(
      nomor: 1,
      tahun: "2025",
      objekAudit: "Audit Operasional Cabang",
      buktiPermulaan: "Indikasi penyimpangan SOP",
      rev: "1",
      status: "Dalam Proses",
      kode: "BP001",
    ),
    BuktiPermulaanItem(
      nomor: 2,
      tahun: "2025",
      objekAudit: "Audit Keuangan Pusat",
      buktiPermulaan: "Kelebihan pembayaran vendor",
      rev: "2",
      status: "Disetujui",
      kode: "BP002",
    ),
  ];

  factory BuktiPermulaanItem.fromMap(Map<String, dynamic> m) {
    return BuktiPermulaanItem(
      nomor:
          m["nomor"] is int ? m["nomor"] : int.tryParse("${m["nomor"]}") ?? 0,
      tahun: m["tahun"] ?? "-",
      objekAudit: m["objekAudit"] ?? "-",
      buktiPermulaan: m["buktiPermulaan"] ?? "-",
      rev: m["rev"] ?? "-",
      status: m["status"] ?? "-",
      kode: m["#"] ?? m["kode"] ?? "-",
    );
  }
}

class InstruksiAuditItem {
  final int nomor;
  final String tahun;
  final String buktiPermulaan;
  final String instruksiAudit;
  final String auditor;
  final String versi;
  final String status;
  final String kode; // "#"

  InstruksiAuditItem({
    required this.nomor,
    required this.tahun,
    required this.buktiPermulaan,
    required this.instruksiAudit,
    required this.auditor,
    required this.versi,
    required this.status,
    required this.kode,
  });

  static List<InstruksiAuditItem> seed() => [
    InstruksiAuditItem(
      nomor: 1,
      tahun: "2025",
      buktiPermulaan: "BP001",
      instruksiAudit: "Periksa kas kecil",
      auditor: "Tim A",
      versi: "1.0",
      status: "Aktif",
      kode: "INS-001",
    ),
  ];

  factory InstruksiAuditItem.fromMap(Map<String, dynamic> m) {
    return InstruksiAuditItem(
      nomor:
          m["nomor"] is int ? m["nomor"] : int.tryParse("${m["nomor"]}") ?? 0,
      tahun: m["tahun"] ?? "-",
      buktiPermulaan: m["buktiPermulaan"] ?? "-",
      instruksiAudit: m["instruksiAudit"] ?? "-",
      auditor: m["auditor"] ?? "-",
      versi: m["versi"] ?? "-",
      status: m["status"] ?? "-",
      kode: m["#"] ?? m["kode"] ?? "-",
    );
  }
}

class SuratPemanggilanItem {
  final int nomor;
  final String tahun;
  final String buktiPermulaan;
  final String suratPemanggilan;
  final String auditor;
  final String rev;
  final String status;
  final String kode; // "#"

  SuratPemanggilanItem({
    required this.nomor,
    required this.tahun,
    required this.buktiPermulaan,
    required this.suratPemanggilan,
    required this.auditor,
    required this.rev,
    required this.status,
    required this.kode,
  });

  static List<SuratPemanggilanItem> seed() => [
    SuratPemanggilanItem(
      nomor: 1,
      tahun: "2025",
      buktiPermulaan: "BP001",
      suratPemanggilan: "SP-001/INV/2025",
      auditor: "Tim A",
      rev: "0",
      status: "Terkirim",
      kode: "SP001",
    ),
  ];

  factory SuratPemanggilanItem.fromMap(Map<String, dynamic> m) {
    return SuratPemanggilanItem(
      nomor:
          m["nomor"] is int ? m["nomor"] : int.tryParse("${m["nomor"]}") ?? 0,
      tahun: m["tahun"] ?? "-",
      buktiPermulaan: m["buktiPermulaan"] ?? "-",
      suratPemanggilan: m["suratPemanggilan"] ?? "-",
      auditor: m["auditor"] ?? "-",
      rev: m["rev"] ?? "-",
      status: m["status"] ?? "-",
      kode: m["#"] ?? m["kode"] ?? "-",
    );
  }
}

class PemeriksaanItem {
  final int nomor;
  final String objekAudit;
  final String suratPemanggilan;
  final String kepada;
  final String auditor;
  final String buktiPemeriksaan;
  final String rev;
  final String status;
  final String kode; // "#"

  PemeriksaanItem({
    required this.nomor,
    required this.objekAudit,
    required this.suratPemanggilan,
    required this.kepada,
    required this.auditor,
    required this.buktiPemeriksaan,
    required this.rev,
    required this.status,
    required this.kode,
  });

  static List<PemeriksaanItem> seed() => [
    PemeriksaanItem(
      nomor: 1,
      objekAudit: "Unit Operasional",
      suratPemanggilan: "SP-001/INV/2025",
      kepada: "Kepala Unit",
      auditor: "Tim A",
      buktiPemeriksaan: "BAP-001",
      rev: "0",
      status: "Selesai",
      kode: "PMK001",
    ),
  ];

  factory PemeriksaanItem.fromMap(Map<String, dynamic> m) {
    return PemeriksaanItem(
      nomor:
          m["nomor"] is int ? m["nomor"] : int.tryParse("${m["nomor"]}") ?? 0,
      objekAudit: m["objekAudit"] ?? "-",
      suratPemanggilan: m["suratPemanggilan"] ?? "-",
      kepada: m["kepada"] ?? "-",
      auditor: m["auditor"] ?? "-",
      buktiPemeriksaan: m["buktiPemeriksaan"] ?? "-",
      rev: m["rev"] ?? "-",
      status: m["status"] ?? "-",
      kode: m["#"] ?? m["kode"] ?? "-",
    );
  }
}
