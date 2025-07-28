class SuratPemberitahuanItem {
  final String tahun;
  final String status;
  final int statusCode; // 1: Hijau, 0: Merah, 2: Oranye
  final String objekAudit;
  final String suratTugas;
  final String auditor;
  final String rev;

  SuratPemberitahuanItem({
    required this.tahun,
    required this.status,
    required this.statusCode,
    required this.objekAudit,
    required this.suratTugas,
    required this.auditor,
    required this.rev,
  });

  static List<SuratPemberitahuanItem> getSuratList() {
  List<SuratPemberitahuanItem> suratList = [];

    suratList.add(
      SuratPemberitahuanItem(
      tahun: '2025',
      status: 'Status',
      statusCode: 1,
      objekAudit: 'Administration to HC & Finance Director',
      suratTugas: 'Lorem ipsum dolor siamet',
      auditor: 'Lorem ipsum dolor siamet',
      rev: 'Lorem ipsum dolor siamet',)
    );
    suratList.add(
      SuratPemberitahuanItem(
      tahun: '2024',
      status: 'Status',
      statusCode: 0,
      objekAudit: 'Administration to HC & Finance Director',
      suratTugas: 'Lorem ipsum dolor siamet',
      auditor: 'Lorem ipsum dolor siamet',
      rev: 'Lorem ipsum dolor siamet',
      ),  
    );
    suratList.add(
      SuratPemberitahuanItem(
      tahun: '2025',
      status: 'Status',
      statusCode: 1,
      objekAudit: 'Administration to HC & Finance Director',
      suratTugas: 'Lorem ipsum dolor siamet',
      auditor: 'Lorem ipsum dolor siamet',
      rev: 'Lorem ipsum dolor siamet',)
    );
    suratList.add(
      SuratPemberitahuanItem(
      tahun: '2023',
      status: 'Status',
      statusCode: 2,
      objekAudit: 'Administration to HC & Finance Director',
      suratTugas: 'Lorem ipsum dolor siamet',
      auditor: 'Lorem ipsum dolor siamet',
      rev: 'Lorem ipsum dolor siamet',
      ),
    );
    return suratList;
  }
}


class ProgramAuditModel {
  final String tahun;
  final String status;
  final int statusCode; // 1: Hijau, 0: Merah, 2: Oranye
  final String objekAudit;
  final String suratTugas;
  final String auditor;
  final String rev;

  ProgramAuditModel({
    required this.tahun,
    required this.status,
    required this.statusCode,
    required this.objekAudit,
    required this.suratTugas,
    required this.auditor,
    required this.rev,
  });

  static List<ProgramAuditModel> getProgramAuditList() {
  List<ProgramAuditModel> programAuditModelList = [];

    programAuditModelList.add(
      ProgramAuditModel(
      tahun: '2025',
      status: 'Status',
      statusCode: 1,
      objekAudit: 'Administration to HC & Finance Director',
      suratTugas: 'Lorem ipsum dolor siamet',
      auditor: 'Lorem ipsum dolor siamet',
      rev: 'Lorem ipsum dolor siamet',)
    );
    programAuditModelList.add(
      ProgramAuditModel(
      tahun: '2024',
      status: 'Status',
      statusCode: 0,
      objekAudit: 'Administration to HC & Finance Director',
      suratTugas: 'Lorem ipsum dolor siamet',
      auditor: 'Lorem ipsum dolor siamet',
      rev: 'Lorem ipsum dolor siamet',
      ),  
    );
    programAuditModelList.add(
      ProgramAuditModel(
      tahun: '2024',
      status: 'Status',
      statusCode: 0,
      objekAudit: 'Administration to HC & Finance Director',
      suratTugas: 'Lorem ipsum dolor siamet',
      auditor: 'Lorem ipsum dolor siamet',
      rev: 'Lorem ipsum dolor siamet',)
    );
    programAuditModelList.add(
      ProgramAuditModel(
      tahun: '2023',
      status: 'Status',
      statusCode: 2,
      objekAudit: 'Administration to HC & Finance Director',
      suratTugas: 'Lorem ipsum dolor siamet',
      auditor: 'Lorem ipsum dolor siamet',
      rev: 'Lorem ipsum dolor siamet',
      ),
    );
    return programAuditModelList;
  }
  
}