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

//PROGRAM KERJA
class ProgramKerjaModel {
  String name;
  String iconPath;
  Color boxColor;

  ProgramKerjaModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<ProgramKerjaModel> getProgramKerja() {
    List<ProgramKerjaModel> prokerModel = [];

    prokerModel.add(
      ProgramKerjaModel(
        name: 'PKAT',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    prokerModel.add(
      ProgramKerjaModel(
        name: 'Rencana Biaya',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    prokerModel.add(
      ProgramKerjaModel(
        name: 'Dokumen PKAT',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    return prokerModel;
  }
}

//PERSIAPAN AUDIT
class PersiapanAuditModel {
  String name;
  String iconPath;
  Color boxColor;

  PersiapanAuditModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<PersiapanAuditModel> getPersiapanAudit() {
    List<PersiapanAuditModel> persiapanAuditModel = [];

    persiapanAuditModel.add(
      PersiapanAuditModel(
        name: 'Surat Pemberitahuan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    persiapanAuditModel.add(
      PersiapanAuditModel(
        name: 'Program Audit',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    persiapanAuditModel.add(
      PersiapanAuditModel(
        name: 'Biaya Penugasan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    return persiapanAuditModel;
  }
}

//PELAKSANAAN AUDIT
class PelaksanaanAuditModel {
  String name;
  String iconPath;
  Color boxColor;

  PelaksanaanAuditModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<PelaksanaanAuditModel> getPelaksanaanAudit() {
    List<PelaksanaanAuditModel> pelaksanaanAuditModel = [];

    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Undangan Opening',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Opening Meeting',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Permintaan Dokumen',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Pemenuhan Dokumen',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Draft LHA',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Review Draft LHA',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );
    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Tanggapan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Temuan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Undangan Closing',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Closing Meeting',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaksanaanAuditModel.add(
      PelaksanaanAuditModel(
        name: 'Komitmen',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );
    return pelaksanaanAuditModel;
  }
}

class PelaporanAuditModel {
  String name;
  String iconPath;
  Color boxColor;

  PelaporanAuditModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<PelaporanAuditModel> getPelaporanAudit() {
    List<PelaporanAuditModel> pelaporanAuditModel = [];

    pelaporanAuditModel.add(
      PelaporanAuditModel(
        name: 'Surat Kesediaan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaporanAuditModel.add(
      PelaporanAuditModel(
        name: 'Executive Summary',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaporanAuditModel.add(
      PelaporanAuditModel(
        name: 'LHP',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelaporanAuditModel.add(
      PelaporanAuditModel(
        name: 'Realisasi Biaya',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    return pelaporanAuditModel;
  }
}

//todo: tambah ke homepage=============================
class TindakLanjutAuditModel {
  String name;
  String iconPath;
  Color boxColor;

  TindakLanjutAuditModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<TindakLanjutAuditModel> getTindakLanjutAudit() {
    List<TindakLanjutAuditModel> tindakLanjutAuditModel = [];

    tindakLanjutAuditModel.add(
      TindakLanjutAuditModel(
        name: 'Memo Tindak Lanjut',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    tindakLanjutAuditModel.add(
      TindakLanjutAuditModel(
        name: 'Tindak Lanjut Temuan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    tindakLanjutAuditModel.add(
      TindakLanjutAuditModel(
        name: 'Review Tindak Lanjut',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    tindakLanjutAuditModel.add(
      TindakLanjutAuditModel(
        name: 'BA Penyelesaian',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    return tindakLanjutAuditModel;
  }
}

class PenilaianKinerjaModel {
  String name;
  String iconPath;
  Color boxColor;

  PenilaianKinerjaModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<PenilaianKinerjaModel> getPenilaianKinerja() {
    List<PenilaianKinerjaModel> penilaianKinerjaModel = [];

    penilaianKinerjaModel.add(
      PenilaianKinerjaModel(
        name: 'Penilaian Kinerja',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    return penilaianKinerjaModel;
  }
}

class SurveyKepuasanAuditModel {
  String name;
  String iconPath;
  Color boxColor;

  SurveyKepuasanAuditModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<SurveyKepuasanAuditModel> getSurveyKepuasanAudit() {
    List<SurveyKepuasanAuditModel> surveyKepuasanAuditModel = [];

    surveyKepuasanAuditModel.add(
      SurveyKepuasanAuditModel(
        name: 'Pengiriman',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    surveyKepuasanAuditModel.add(
      SurveyKepuasanAuditModel(
        name: 'Pengisian',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    surveyKepuasanAuditModel.add(
      SurveyKepuasanAuditModel(
        name: 'Hasil Survey',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );
    return surveyKepuasanAuditModel;
  }
}

class InvestigasiModel {
  String name;
  String iconPath;
  Color boxColor;

  InvestigasiModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<InvestigasiModel> getInvestigasi() {
    List<InvestigasiModel> investigasiModel = [];

    investigasiModel.add(
      InvestigasiModel(
        name: 'Bukti Permulaan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    investigasiModel.add(
      InvestigasiModel(
        name: 'Instruksi Audit',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    investigasiModel.add(
      InvestigasiModel(
        name: 'Surat Pemanggilan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    investigasiModel.add(
      InvestigasiModel(
        name: 'Pemeriksaan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );
    return investigasiModel;
  }
}

class AuditEksternalModel {
  String name;
  String iconPath;
  Color boxColor;

  AuditEksternalModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<AuditEksternalModel> getAuditEksternal() {
    List<AuditEksternalModel> auditEksternalModel = [];

    auditEksternalModel.add(
      AuditEksternalModel(
        name: 'Register',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    auditEksternalModel.add(
      AuditEksternalModel(
        name: 'Tindak Lanjut',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    return auditEksternalModel;
  }
}

class KonsultasiModel {
  String name;
  String iconPath;
  Color boxColor;

  KonsultasiModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<KonsultasiModel> getKonsultasiModel() {
    List<KonsultasiModel> konsultasiModel = [];

    konsultasiModel.add(
      KonsultasiModel(
        name: 'Form Konsultasi',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    konsultasiModel.add(
      KonsultasiModel(
        name: 'Realisasi',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    konsultasiModel.add(
      KonsultasiModel(
        name: 'Tanya Jawab',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    return konsultasiModel;
  }
}

class PelatihanAuditorModel {
  String name;
  String iconPath;
  Color boxColor;

  PelatihanAuditorModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<PelatihanAuditorModel> getPelatihanAuditorModel() {
    List<PelatihanAuditorModel> pelatihanAuditorModel = [];

    pelatihanAuditorModel.add(
      PelatihanAuditorModel(
        name: 'Perencanaan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    pelatihanAuditorModel.add(
      PelatihanAuditorModel(
        name: 'Realisasi',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    return pelatihanAuditorModel;
  }
}

class RapatUmumModel {
  String name;
  String iconPath;
  Color boxColor;

  RapatUmumModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<RapatUmumModel> getRapatUmumModel() {
    List<RapatUmumModel> rapatUmumModel = [];

    rapatUmumModel.add(
      RapatUmumModel(
        name: 'Undangan Rapat',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    rapatUmumModel.add(
      RapatUmumModel(
        name: 'Risalah Rapat',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    return rapatUmumModel;
  }
}
