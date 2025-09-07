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
import 'package:audit_app_magang/pages/review_tindak_lanjutpage.dart';
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
import 'package:audit_app_magang/widget/navbar.dart';
import 'package:audit_app_magang/pages/profilepage.dart';
import 'package:audit_app_magang/model/slideanim.dart'; // slideRoute/slideRightRoute

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<ProgramKerjaModel> programKerja = [];
  List<PersiapanAuditModel> persiapanAudit = [];
  List<PelaksanaanAuditModel> pelaksanaanAudit = [];
  List<PelaporanAuditModel> pelaporanAudit = [];
  List<TindakLanjutAuditModel> tindakLanjutAudit = [];
  List<PenilaianKinerjaModel> penilaianKinerja = [];
  List<SurveyKepuasanAuditModel> surveyKepuasanAudit = [];
  List<InvestigasiModel> investigasi = [];
  List<AuditEksternalModel> auditEksternal = [];
  List<KonsultasiModel> konsultasi = [];
  List<PelatihanAuditorModel> pelatihanAuditor = [];
  List<RapatUmumModel> rapatUmum = [];

  int _navIndex = 0;

  void _go(Widget page, {AxisDirection dir = AxisDirection.left}) {
    Navigator.push(context, slideRoute(page, direction: dir));
  }

  @override
  void initState() {
    super.initState();
    programKerja = ProgramKerjaModel.getProgramKerja();
    persiapanAudit = PersiapanAuditModel.getPersiapanAudit();
    pelaksanaanAudit = PelaksanaanAuditModel.getPelaksanaanAudit();
    pelaporanAudit = PelaporanAuditModel.getPelaporanAudit();
    tindakLanjutAudit = TindakLanjutAuditModel.getTindakLanjutAudit();
    penilaianKinerja = PenilaianKinerjaModel.getPenilaianKinerja();
    surveyKepuasanAudit = SurveyKepuasanAuditModel.getSurveyKepuasanAudit();
    investigasi = InvestigasiModel.getInvestigasi();
    auditEksternal = AuditEksternalModel.getAuditEksternal();
    konsultasi = KonsultasiModel.getKonsultasiModel();
    pelatihanAuditor = PelatihanAuditorModel.getPelatihanAuditorModel();
    rapatUmum = RapatUmumModel.getRapatUmumModel();
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
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: programKerjaMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: persiapanAuditMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: pelaksanaanAuditMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: pelaporanAuditMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: tindakLanjutMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: penilaianKinerjaMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: surveKepuasanAuditMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: investigasiMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: auditEksternalMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: konsultasiMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: pelatihanAuditorMenu(context),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              child: rapatUmumMenu(context),
            ),
            const SizedBox(height: 4),
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
              break;
            case 1:
              _go(const NotifikasiPage());
              break;
          }
        },
      ),
    );
  }

  // ============= SECTIONS =============
  Container programKerjaMenu(BuildContext context) {
    return _menuCard(
      title: "Program Kerja",
      children: List.generate(programKerja.length, (index) {
        final item = programKerja[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'PKAT':
                _go(const PkatPage());
                break;
              case 'Rencana Biaya':
                _go(const RencanaBiayaPage());
                break;
              case 'Dokumen PKAT':
                _go(const DokumenPkatPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container persiapanAuditMenu(BuildContext context) {
    return _menuCard(
      title: "Persiapan Audit",
      children: List.generate(persiapanAudit.length, (index) {
        final item = persiapanAudit[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Surat Pemberitahuan':
                _go(const SuratPemberitahuanPage());
                break;
              case 'Program Audit':
                _go(const ProgramAuditPage());
                break;
              case 'Biaya Penugasan':
                _go(const BiayaPenugasanPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container pelaksanaanAuditMenu(BuildContext context) {
    return _menuCard(
      title: "Pelaksanaan Audit",
      children: List.generate(pelaksanaanAudit.length, (index) {
        final item = pelaksanaanAudit[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Undangan Opening':
                _go(const UndanganOpeningPage());
                break;
              case 'Opening Meeting':
                _go(const OpeningMeetingPage());
                break;
              case 'Permintaan Dokumen':
                _go(const PermintaanDokumenPage());
                break;
              case 'Pemenuhan Dokumen':
                _go(const PemenuhanDokumenPage());
                break;
              case 'Draft LHA':
                _go(const DraftLHAPage());
                break;
              case 'Review Draft LHA':
                _go(const ReviewDraftLHAPage());
                break;
              case 'Tanggapan':
                _go(const TanggapanPage());
                break;
              case 'Temuan':
                _go(const TemuanPage());
                break;
              case 'Undangan Closing':
                _go(const UndanganClosingPage());
                break;
              case 'Closing Meeting':
                _go(const ClosingMeetingPage());
                break;
              case 'Komitmen':
                _go(const KomitmenPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container pelaporanAuditMenu(BuildContext context) {
    return _menuCard(
      title: "Pelaporan Audit",
      children: List.generate(pelaporanAudit.length, (index) {
        final item = pelaporanAudit[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Surat Kesediaan':
                _go(const SuratKesediaanPage());
                break;
              case 'Executive Summary':
                _go(const ExecutiveSummaryPage());
                break;
              case 'LHP':
                _go(const LHPPage());
                break;
              case 'Realisasi Biaya':
                _go(const RealisasiBiayaPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container tindakLanjutMenu(BuildContext context) {
    return _menuCard(
      title: "Tindak Lanjut Audit",
      children: List.generate(tindakLanjutAudit.length, (index) {
        final item = tindakLanjutAudit[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Memo Tindak Lanjut':
                _go(const MemoTindakLanjutPage());
                break;
              case 'Tindak Lanjut Temuan':
                _go(const TindakLanjutTemuanPage());
                break;
              case 'Review Tindak Lanjut':
                _go(const ReviewTindakLanjutPage());
                break;
              case 'BA Penyelesaian':
                _go(const BAPenyelesaianPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container penilaianKinerjaMenu(BuildContext context) {
    return _menuCard(
      title: "Penilaian Kinerja",
      children: List.generate(penilaianKinerja.length, (index) {
        final item = penilaianKinerja[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Penilaian Kinerja':
                _go(const PenilaianKinerjaPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container surveKepuasanAuditMenu(BuildContext context) {
    return _menuCard(
      title: "Survey Kepuasan Audit",
      children: List.generate(surveyKepuasanAudit.length, (index) {
        final item = surveyKepuasanAudit[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Pengiriman':
                _go(const PengirimanPage());
                break;
              case 'Pengisian':
                _go(const PengisianPage());
                break;
              case 'Hasil Survey':
                _go(const HasilSurveyPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container investigasiMenu(BuildContext context) {
    return _menuCard(
      title: "Investigasi",
      children: List.generate(investigasi.length, (index) {
        final item = investigasi[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Bukti Permulaan':
                _go(const BuktiPermulaanPage());
                break;
              case 'Instruksi Audit':
                _go(const InstruksiAuditPage());
                break;
              case 'Surat Pemanggilan':
                _go(const SuratPemanggilanPage());
                break;
              case 'Pemeriksaan':
                _go(const PemeriksaanPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container auditEksternalMenu(BuildContext context) {
    return _menuCard(
      title: "Audit Eksternal",
      children: List.generate(auditEksternal.length, (index) {
        final item = auditEksternal[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Register':
                _go(const RegisterAuditEksternalpage());
                break;
              case 'Tindak Lanjut':
                _go(const TindakLanjutAuditEksternalPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container konsultasiMenu(BuildContext context) {
    return _menuCard(
      title: "Konsultasi",
      children: List.generate(konsultasi.length, (index) {
        final item = konsultasi[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Form Konsultasi':
                _go(const FormKonsultasiPage());
                break;
              case 'Realisasi':
                _go(const RealisasiKonsultasiPage());
                break;
              case 'Tanya Jawab':
                _go(const TanyaJawabPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container pelatihanAuditorMenu(BuildContext context) {
    return _menuCard(
      title: "Pelatihan Auditor",
      children: List.generate(pelatihanAuditor.length, (index) {
        final item = pelatihanAuditor[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Perencanaan':
                _go(const PerencanaanPage());
                break;
              case 'Realisasi':
                _go(const RealisasiPelatihanAuditorPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  Container rapatUmumMenu(BuildContext context) {
    return _menuCard(
      title: "Rapat Umum",
      children: List.generate(rapatUmum.length, (index) {
        final item = rapatUmum[index];
        return _menuItem(
          icon: item.icon,
          color: item.boxColor,
          label: item.name,
          onTap: () {
            switch (item.name) {
              case 'Undangan Rapat':
                _go(const UndanganRapatUmumPage());
                break;
              case 'Risalah Rapat':
                _go(const RisalahRapatUmumPage());
                break;
              default:
                _notReady();
            }
          },
        );
      }),
    );
  }

  // ============= UI HELPERS =============
  Container _menuCard({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blueGrey.shade400.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  void _notReady() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Halaman belum tersedia')));
  }

  // ============= APP BAR =============
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
                    // tombol menu
                    GestureDetector(
                      onTap: () => _scaffoldKey.currentState?.openDrawer(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    // profil
                    GestureDetector(
                      onTap: () => _go(const ProfilePage()),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
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
