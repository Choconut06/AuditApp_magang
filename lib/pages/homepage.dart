import 'package:audit_app_magang/model/mainmenu.dart';
import 'package:audit_app_magang/pages/LHPpage.dart';
import 'package:audit_app_magang/pages/ba_penyelesaianpage.dart';
import 'package:audit_app_magang/pages/biaya_penugasanpage.dart';
import 'package:audit_app_magang/pages/bukti_permulaanpage.dart';
import 'package:audit_app_magang/pages/dokumen_pkatpage.dart';
import 'package:audit_app_magang/pages/executive_summarypage.dart';
import 'package:audit_app_magang/pages/form_konsultasipage.dart';
import 'package:audit_app_magang/pages/hasil_surveypage.dart';
import 'package:audit_app_magang/pages/instruksi_auditpage.dart';
import 'package:audit_app_magang/pages/memo_tindak_lanjutpage.dart';
import 'package:audit_app_magang/pages/modulpage.dart';
import 'package:audit_app_magang/pages/notifikasipage.dart';
import 'package:audit_app_magang/pages/pemeriksaanpage.dart';
import 'package:audit_app_magang/pages/pengirimanpage.dart';
import 'package:audit_app_magang/pages/pengisianpage.dart';
import 'package:audit_app_magang/pages/penilaian_kinerjapage.dart';
import 'package:audit_app_magang/pages/perencanaanpage.dart';
import 'package:audit_app_magang/pages/pkatpage.dart';
import 'package:audit_app_magang/pages/program__auditpage.dart';
import 'package:audit_app_magang/pages/realisasi_biayapage.dart';
import 'package:audit_app_magang/pages/realisasi_konsultasipage.dart';
import 'package:audit_app_magang/pages/realisasi_pelatihan_auditorpage.dart';
import 'package:audit_app_magang/pages/register_audit_eksternalpage.dart';
import 'package:audit_app_magang/pages/rencana_biayapage.dart';
import 'package:audit_app_magang/pages/risalah_rapat_umumpage.dart';
import 'package:audit_app_magang/pages/surat_kesediaanpage.dart';
import 'package:audit_app_magang/pages/surat_pemanggilanpage.dart';
import 'package:audit_app_magang/pages/surat_pemberitahuanpage.dart';
import 'package:audit_app_magang/pages/tanya_jawabpage.dart';
import 'package:audit_app_magang/pages/tindak_lanjut_audit_eksternalpage.dart';
import 'package:audit_app_magang/pages/tindak_lanjut_temuanpage.dart';
import 'package:audit_app_magang/pages/undangan_openingpage.dart';
import 'package:audit_app_magang/pages/undangan_rapat_umumpage.dart';
import 'package:audit_app_magang/widget/sidebar.dart';
import 'package:audit_app_magang/pages/opening_meetingpage.dart';
import 'package:audit_app_magang/pages/permintaan_dokumenpage.dart';
import 'package:audit_app_magang/pages/pemenuhan_dokumenpage.dart';
import 'package:audit_app_magang/pages/draft_lhapage.dart';
import 'package:audit_app_magang/pages/review_draft_lhapage.dart';
import 'package:audit_app_magang/pages/tanggapanpage.dart';
import 'package:audit_app_magang/pages/temuanpage.dart';
import 'package:audit_app_magang/pages/undangan_closingpage.dart';
import 'package:audit_app_magang/pages/closing_meetingpage.dart';
import 'package:audit_app_magang/pages/komitmenpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'risk_assessment.dart';
import 'package:audit_app_magang/widget/navbar.dart';
import 'package:audit_app_magang/pages/profilepage.dart';
import 'package:audit_app_magang/model/slideanim.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<MainMenuModel> mainMenu = [];
  List<ProgramKerjaModel> programKerja = [];
  List<PersiapanAuditModel> persiapanAudit = [];
  List<PelaksanaanAuditModel> pelaksanaanAudit = [];

  int _navIndex = 0; // index navbar

  @override
  void initState() {
    super.initState();
    _getMainMenu();
    _getProgramKerja();
    _getPersiapanAudit();
    _getPelaksanaanAudit();
  }

  void _getMainMenu() {
    mainMenu = MainMenuModel.getMainMenu();
  }

  void _getProgramKerja() {
    programKerja = ProgramKerjaModel.getProgramKerja();
  }

  void _getPersiapanAudit() {
    persiapanAudit = PersiapanAuditModel.getPersiapanAudit();
  }

  void _getPelaksanaanAudit() {
    pelaksanaanAudit = PelaksanaanAuditModel.getPelaksanaanAudit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Center(child: menuContainer()),
            ),
            const SizedBox(height: 4),
            Padding(
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Program Kerja",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // Isi card
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.spaceEvenly,
                        children: List.generate(programKerja.length, (index) {
                          final item = programKerja[index];
                          return GestureDetector(
                            onTap: () {
                              switch (item.name) {
                                case 'PKAT':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PkatPage(),
                                    ),
                                  );
                                  break;
                                case 'Rencana Biaya':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const RencanaBiayaPage(),
                                    ),
                                  );
                                  break;
                                case 'Dokumen PKAT':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const DokumenPkatPage(),
                                    ),
                                  );
                                  break;
                                default:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Halaman belum tersedia'),
                                    ),
                                  );
                              }
                            },
                            child: SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: item.boxColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SvgPicture.asset(
                                        item.iconPath,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Persiapan Audit",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // Isi card
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.spaceEvenly,
                        children: List.generate(persiapanAudit.length, (index) {
                          final item = persiapanAudit[index];
                          return GestureDetector(
                            onTap: () {
                              switch (item.name) {
                                case 'Surat Pemberitahuan':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const SuratPemberitahuanPage(),
                                    ),
                                  );
                                  break;
                                case 'Program Audit':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const ProgramAuditPage(),
                                    ),
                                  );
                                  break;
                                case 'Biaya Penugasan':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const BiayaPenugasanPage(),
                                    ),
                                  );
                                  break;
                                default:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Halaman belum tersedia'),
                                    ),
                                  );
                              }
                            },
                            child: SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: item.boxColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SvgPicture.asset(
                                        item.iconPath,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Pelaksanaan Audit",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // Isi card
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.spaceEvenly,
                        children: List.generate(pelaksanaanAudit.length, (
                          index,
                        ) {
                          final item = pelaksanaanAudit[index];
                          return GestureDetector(
                            onTap: () {
                              switch (item.name) {
                                case 'Undangan Opening':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const UndanganOpeningPage(),
                                    ),
                                  );
                                  break;
                                case 'Opening Meeting':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const OpeningMeetingPage(),
                                    ),
                                  );
                                  break;
                                case 'Permintaan Dokumen':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const PermintaanDokumenPage(),
                                    ),
                                  );
                                  break;
                                case 'Pemenuhan Dokumen':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const PemenuhanDokumenPage(),
                                    ),
                                  );
                                  break;
                                case 'Draft LHA':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const DraftLHAPage(),
                                    ),
                                  );
                                  break;
                                case 'Review Draft LHA':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const ReviewDraftLHAPage(),
                                    ),
                                  );
                                  break;
                                case 'Tanggapan':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const TanggapanPage(),
                                    ),
                                  );
                                  break;
                                case 'Temuan':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const TemuanPage(),
                                    ),
                                  );
                                  break;
                                case 'Undangan Closing':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const UndanganClosingPage(),
                                    ),
                                  );
                                  break;
                                case 'Closing Meeting':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const ClosingMeetingPage(),
                                    ),
                                  );
                                  break;
                                case 'Komitmen':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const KomitmenPage(),
                                    ),
                                  );
                                  break;
                                default:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Halaman belum tersedia'),
                                    ),
                                  );
                              }
                            },
                            child: SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: item.boxColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SvgPicture.asset(
                                        item.iconPath,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _navIndex,
        onTap: (i) {
          if (i == _navIndex) return;
          setState(() => _navIndex = i);
          switch (i) {
            case 0:
              // Beranda (stay di halaman ini)
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotifikasiPage()),
              );
          }
        },
      ),
    );
  }

  Container menuContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.spaceEvenly,
        children: List.generate(mainMenu.length, (index) {
          final item = mainMenu[index];
          return GestureDetector(
            onTap: () {
              switch (item.name) {
                case 'Penilaian Risiko':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiskAssessmentPage(),
                    ),
                  );
                  break;
                case 'PKAT':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PkatPage()),
                  );
                  break;
                case 'Rencana Biaya':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RencanaBiayaPage(),
                    ),
                  );
                  break;
                case 'Dokumen PKAT':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DokumenPkatPage(),
                    ),
                  );
                  break;
                case 'Surat Pemberitahuan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuratPemberitahuanPage(),
                    ),
                  );
                  break;
                case 'Program Audit':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProgramAuditPage(),
                    ),
                  );
                  break;
                case 'Undangan Opening':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UndanganOpeningPage(),
                    ),
                  );
                  break;
                case 'Opening Meeting':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OpeningMeetingPage(),
                    ),
                  );
                  break;
                case 'Permintaan Dokumen':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PermintaanDokumenPage(),
                    ),
                  );
                  break;
                case 'Pemenuhan Dokumen':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PemenuhanDokumenPage(),
                    ),
                  );
                  break;
                case 'Draft LHA':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DraftLHAPage(),
                    ),
                  );
                  break;
                case 'Review Draft LHA':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewDraftLHAPage(),
                    ),
                  );
                  break;
                case 'Tanggapan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TanggapanPage(),
                    ),
                  );
                  break;
                case 'Temuan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TemuanPage()),
                  );
                  break;
                case 'Undangan Closing':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UndanganClosingPage(),
                    ),
                  );
                  break;
                case 'Closing Meeting':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ClosingMeetingPage(),
                    ),
                  );
                  break;
                case 'Komitmen':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KomitmenPage(),
                    ),
                  );
                  break;
                case 'Surat Kesediaan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuratKesediaanPage(),
                    ),
                  );
                  break;
                case 'Executive Summary':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExecutiverSummaryPage(),
                    ),
                  );
                  break;
                case 'LHP':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LHPPage()),
                  );
                  break;
                case 'Realisasi Biaya':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RealisasiBiayaPage(),
                    ),
                  );
                  break;
                case 'Biaya Penugasan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BiayaPenugasanPage(),
                    ),
                  );
                  break;
                case 'Memo Tindak Lanjut':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MemoTindakLanjutPage(),
                    ),
                  );
                  break;
                case 'Tindak Lanjut Temuan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TindakLanjutTemuanPage(),
                    ),
                  );
                  break;
                case 'BA Penyelesaian':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BAPenyelesaianPage(),
                    ),
                  );
                  break;
                case 'Penilaian Kinerja':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PenilaianKinerjaPage(),
                    ),
                  );
                  break;
                case 'Pengiriman':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PengirimanPage(),
                    ),
                  );
                  break;
                case 'Pengisian':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pengisianpage(),
                    ),
                  );
                  break;
                case 'Hasil Survey':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HasilSurveypage(),
                    ),
                  );
                  break;
                case 'Bukti Permulaan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuktiPermulaanpage(),
                    ),
                  );
                  break;
                case 'Instruksi Audit':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InstruksiAuditPage(),
                    ),
                  );
                  break;
                case 'Surat Pemanggilan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuratPemanggilanPage(),
                    ),
                  );
                  break;
                case 'Pemeriksaan Investigasi':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PemeriksaanPage(),
                    ),
                  );
                  break;
                case 'Register Audit Eksternal':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterAuditEksternalpage(),
                    ),
                  );
                  break;
                case 'Tindak Lanjut Audit Eksternal':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => const TindakLanjutAuditEksternalpage(),
                    ),
                  );
                  break;
                case 'Form Konsultasi':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormKonsultasipage(),
                    ),
                  );
                  break;
                case 'Realisasi Konsultasi':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RealisasiKonsultasipage(),
                    ),
                  );
                  break;
                case 'Tanya Jawab':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TanyaJawabpage(),
                    ),
                  );
                  break;
                case 'Perencanaan':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Perencanaanpage(),
                    ),
                  );
                  break;
                case 'Realisasi Pelatihan Auditor':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => const RealisasiPelatihanAuditorpage(),
                    ),
                  );
                  break;
                case 'Undangan Rapat Umum':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UndanganRapatUmumpage(),
                    ),
                  );
                  break;
                case 'Risalah Rapat Umum':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RisalahRapatUmumpage(),
                    ),
                  );
                  break;
                default:
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Halaman belum tersedia')),
                  );
              }
            },
            child: SizedBox(
              width: 80,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: item.boxColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        item.iconPath,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[400],
        flexibleSpace: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Menu Button
                    GestureDetector(
                      onTap: () => _scaffoldKey.currentState?.openDrawer(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/three-lines.svg',
                          color: Colors.white,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    // Profile icon
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          slideRightRoute(const ProfilePage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/profile.svg',
                          color: Colors.white,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
