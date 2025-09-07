import 'package:flutter/material.dart';

// class MainMenuModel {
//   String name;
//   String iconPath;
//   Color boxColor;

//   MainMenuModel({
//     required this.name,
//     required this.iconPath,
//     required this.boxColor,
//   });

//   //list sementara hardcode next nya akan dibuat menggunakan database
//   static List<MainMenuModel> getMainMenu() {
//     List<MainMenuModel> mainMenu = [];

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Penilaian Risiko',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     // mainMenu.add(
//     //   MainMenuModel(
//     //     name: 'PKAT',
//     //     iconPath: 'assets/icons/pictures.svg',
//     //     boxColor: Colors.blue.shade400,
//     //   ),
//     // );

//     // mainMenu.add(
//     //   MainMenuModel(
//     //     name: 'Rencana Biaya',
//     //     iconPath: 'assets/icons/pictures.svg',
//     //     boxColor: Colors.blue.shade400,
//     //   ),
//     // );

//     // mainMenu.add(
//     //   MainMenuModel(
//     //     name: 'Dokumen PKAT',
//     //     iconPath: 'assets/icons/pictures.svg',
//     //     boxColor: Colors.blue.shade400,
//     //   ),
//     // );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Surat Pemberitahuan',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Program Audit',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Biaya Penugasan',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Undangan Opening',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Opening Meeting',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Permintaan Dokumen',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Pemenuhan Dokumen',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Draft LHA',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );
//     mainMenu.add(
//       MainMenuModel(
//         name: 'Review Draft LHA',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Tanggapan',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Temuan',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Undangan Closing',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Closing Meeting',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Komitmen',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Surat Kesediaan',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Executive Summary',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'LHP',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Realisasi Biaya',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Memo Tindak Lanjut',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Tindak Lanjut Temuan',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Review Tindak Lanjut',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'BA Penyelesaian',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Penilaian Kinerja',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Pengiriman',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Pengisian',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Hasil Survey',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Bukti Permulaan',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Instruksi Audit',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Surat Pemanggilan',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Pemeriksaan Investigasi',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );
//     //AUDIT EKSTERNAL
//     mainMenu.add(
//       MainMenuModel(
//         name: 'Register Audit Eksternal',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Tindak Lanjut Audit Eksternal',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );
//     //KONSULTASI
//     mainMenu.add(
//       MainMenuModel(
//         name: 'Form Konsultasi',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Realisasi Konsultasi',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Tanya Jawab',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );
//     //Pelatihan Auditor
//     mainMenu.add(
//       MainMenuModel(
//         name: 'Perencanaan',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Realisasi Pelatihan Auditor',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );
//     // RAPAT UMUM
//     mainMenu.add(
//       MainMenuModel(
//         name: 'Undangan Rapat Umum',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     mainMenu.add(
//       MainMenuModel(
//         name: 'Risalah Rapat Umum',
//         iconPath: 'assets/icons/pictures.svg',
//         boxColor: Colors.blue.shade400,
//       ),
//     );

//     return mainMenu;
//   }
// }

/// PROGRAM KERJA

class ProgramKerjaModel {
  String name;
  IconData icon;
  Color boxColor;

  ProgramKerjaModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<ProgramKerjaModel> getProgramKerja() {
    return [
      ProgramKerjaModel(
        name: 'PKAT',
        icon: Icons.assignment, // ganti sesuka hati
        boxColor: Colors.blue.shade400,
      ),
      ProgramKerjaModel(
        name: 'Rencana Biaya',
        icon: Icons.calculate,
        boxColor: Colors.blue.shade400,
      ),
      ProgramKerjaModel(
        name: 'Dokumen PKAT',
        icon: Icons.folder,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// PERSIAPAN AUDIT
class PersiapanAuditModel {
  String name;
  IconData icon;
  Color boxColor;

  PersiapanAuditModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<PersiapanAuditModel> getPersiapanAudit() {
    return [
      PersiapanAuditModel(
        name: 'Surat Pemberitahuan',
        icon: Icons.mark_email_unread,
        boxColor: Colors.blue.shade400,
      ),
      PersiapanAuditModel(
        name: 'Program Audit',
        icon: Icons.fact_check,
        boxColor: Colors.blue.shade400,
      ),
      PersiapanAuditModel(
        name: 'Biaya Penugasan',
        icon: Icons.payments,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// PELAKSANAAN AUDIT
class PelaksanaanAuditModel {
  String name;
  IconData icon;
  Color boxColor;

  PelaksanaanAuditModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<PelaksanaanAuditModel> getPelaksanaanAudit() {
    return [
      PelaksanaanAuditModel(
        name: 'Undangan Opening',
        icon: Icons.forward_to_inbox,
        boxColor: Colors.blue.shade400,
      ),
      PelaksanaanAuditModel(
        name: 'Opening Meeting',
        icon: Icons.meeting_room,
        boxColor: Colors.blue.shade400,
      ),
      PelaksanaanAuditModel(
        name: 'Permintaan Dokumen',
        icon: Icons.request_page,
        boxColor: Colors.blue.shade400,
      ),
      PelaksanaanAuditModel(
        name: 'Pemenuhan Dokumen',
        icon: Icons.rule_folder,
        boxColor: Colors.blue.shade400,
      ),
      PelaksanaanAuditModel(
        name: 'Draft LHA',
        icon: Icons.description,
        boxColor: Colors.blue.shade400,
      ),
      PelaksanaanAuditModel(
        name: 'Review Draft LHA',
        icon: Icons.rate_review,
        boxColor: Colors.blue.shade400,
      ),
      PelaksanaanAuditModel(
        name: 'Tanggapan',
        icon: Icons.reply_all,
        boxColor: Colors.blue.shade400,
      ),
      PelaksanaanAuditModel(
        name: 'Temuan',
        icon: Icons.search,
        boxColor: Colors.blue.shade400,
      ),
      PelaksanaanAuditModel(
        name: 'Undangan Closing',
        icon: Icons.mark_email_read,
        boxColor: Colors.blue.shade400,
      ),
      PelaksanaanAuditModel(
        name: 'Closing Meeting',
        icon: Icons.handshake,
        boxColor: Colors.blue.shade400,
      ),
      PelaksanaanAuditModel(
        name: 'Komitmen',
        icon: Icons.task_alt,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// PELAPORAN AUDIT
class PelaporanAuditModel {
  String name;
  IconData icon;
  Color boxColor;

  PelaporanAuditModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<PelaporanAuditModel> getPelaporanAudit() {
    return [
      PelaporanAuditModel(
        name: 'Surat Kesediaan',
        icon: Icons.edit_note,
        boxColor: Colors.blue.shade400,
      ),
      PelaporanAuditModel(
        name: 'Executive Summary',
        icon: Icons.summarize,
        boxColor: Colors.blue.shade400,
      ),
      PelaporanAuditModel(
        name: 'LHP',
        icon: Icons.book,
        boxColor: Colors.blue.shade400,
      ),
      PelaporanAuditModel(
        name: 'Realisasi Biaya',
        icon: Icons.attach_money,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// TINDAK LANJUT AUDIT
class TindakLanjutAuditModel {
  String name;
  IconData icon;
  Color boxColor;

  TindakLanjutAuditModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<TindakLanjutAuditModel> getTindakLanjutAudit() {
    return [
      TindakLanjutAuditModel(
        name: 'Memo Tindak Lanjut',
        icon: Icons.note_alt,
        boxColor: Colors.blue.shade400,
      ),
      TindakLanjutAuditModel(
        name: 'Tindak Lanjut Temuan',
        icon: Icons.playlist_add_check_circle,
        boxColor: Colors.blue.shade400,
      ),
      TindakLanjutAuditModel(
        name: 'Review Tindak Lanjut',
        icon: Icons.reviews,
        boxColor: Colors.blue.shade400,
      ),
      TindakLanjutAuditModel(
        name: 'BA Penyelesaian',
        icon: Icons.assignment_turned_in,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// PENILAIAN KINERJA
class PenilaianKinerjaModel {
  String name;
  IconData icon;
  Color boxColor;

  PenilaianKinerjaModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<PenilaianKinerjaModel> getPenilaianKinerja() {
    return [
      PenilaianKinerjaModel(
        name: 'Penilaian Kinerja',
        icon: Icons.grade,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// SURVEY KEPUASAN AUDIT
class SurveyKepuasanAuditModel {
  String name;
  IconData icon;
  Color boxColor;

  SurveyKepuasanAuditModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<SurveyKepuasanAuditModel> getSurveyKepuasanAudit() {
    return [
      SurveyKepuasanAuditModel(
        name: 'Pengiriman',
        icon: Icons.send,
        boxColor: Colors.blue.shade400,
      ),
      SurveyKepuasanAuditModel(
        name: 'Pengisian',
        icon: Icons.edit,
        boxColor: Colors.blue.shade400,
      ),
      SurveyKepuasanAuditModel(
        name: 'Hasil Survey',
        icon: Icons.insights,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// INVESTIGASI
class InvestigasiModel {
  String name;
  IconData icon;
  Color boxColor;

  InvestigasiModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<InvestigasiModel> getInvestigasi() {
    return [
      InvestigasiModel(
        name: 'Bukti Permulaan',
        icon: Icons.inventory_2,
        boxColor: Colors.blue.shade400,
      ),
      InvestigasiModel(
        name: 'Instruksi Audit',
        icon: Icons.rule,
        boxColor: Colors.blue.shade400,
      ),
      InvestigasiModel(
        name: 'Surat Pemanggilan',
        icon: Icons.mail,
        boxColor: Colors.blue.shade400,
      ),
      InvestigasiModel(
        name: 'Pemeriksaan',
        icon: Icons.fact_check,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// AUDIT EKSTERNAL
class AuditEksternalModel {
  String name;
  IconData icon;
  Color boxColor;

  AuditEksternalModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<AuditEksternalModel> getAuditEksternal() {
    return [
      AuditEksternalModel(
        name: 'Register',
        icon: Icons.app_registration,
        boxColor: Colors.blue.shade400,
      ),
      AuditEksternalModel(
        name: 'Tindak Lanjut',
        icon: Icons.pending_actions,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// KONSULTASI
class KonsultasiModel {
  String name;
  IconData icon;
  Color boxColor;

  KonsultasiModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<KonsultasiModel> getKonsultasiModel() {
    return [
      KonsultasiModel(
        name: 'Form Konsultasi',
        icon: Icons.forum,
        boxColor: Colors.blue.shade400,
      ),
      KonsultasiModel(
        name: 'Realisasi',
        icon: Icons.event_available,
        boxColor: Colors.blue.shade400,
      ),
      KonsultasiModel(
        name: 'Tanya Jawab',
        icon: Icons.question_answer,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// PELATIHAN AUDITOR
class PelatihanAuditorModel {
  String name;
  IconData icon;
  Color boxColor;

  PelatihanAuditorModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<PelatihanAuditorModel> getPelatihanAuditorModel() {
    return [
      PelatihanAuditorModel(
        name: 'Perencanaan',
        icon: Icons.event_note,
        boxColor: Colors.blue.shade400,
      ),
      PelatihanAuditorModel(
        name: 'Realisasi',
        icon: Icons.event_available,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}

/// RAPAT UMUM
class RapatUmumModel {
  String name;
  IconData icon;
  Color boxColor;

  RapatUmumModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<RapatUmumModel> getRapatUmumModel() {
    return [
      RapatUmumModel(
        name: 'Undangan Rapat',
        icon: Icons.mark_email_unread,
        boxColor: Colors.blue.shade400,
      ),
      RapatUmumModel(
        name: 'Risalah Rapat',
        icon: Icons.description,
        boxColor: Colors.blue.shade400,
      ),
    ];
  }
}


// Sampe Sini===========================


//todo: pelaporan