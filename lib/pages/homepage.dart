import 'package:audit_app_magang/model/mainmenu.dart';
import 'package:audit_app_magang/pages/LHPpage.dart';
import 'package:audit_app_magang/pages/ba_penyelesaianpage.dart';
import 'package:audit_app_magang/pages/biaya_penugasanpage.dart';
import 'package:audit_app_magang/pages/dokumen_pkatpage.dart';
import 'package:audit_app_magang/pages/executive_summarypage.dart';
import 'package:audit_app_magang/pages/memo_tindak_lanjutpage.dart';
import 'package:audit_app_magang/pages/pkatpage.dart';
import 'package:audit_app_magang/pages/program__auditpage.dart';
import 'package:audit_app_magang/pages/realisasi_biayapage.dart';
import 'package:audit_app_magang/pages/rencana_biayapage.dart';
import 'package:audit_app_magang/pages/surat_kesediaanpage.dart';
import 'package:audit_app_magang/pages/surat_pemberitahuanpage.dart';
import 'package:audit_app_magang/pages/tindak_lanjut_temuanpage.dart';
import 'package:audit_app_magang/pages/undangan_openingpage.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<MainMenuModel> mainMenu = [];

  @override
  void initState() {
    super.initState();
    _getMainMenu();
  }

  void _getMainMenu() {
    mainMenu = MainMenuModel.getMainMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(child: menuContainer()),
        ),
      ),
    );
  }

  Container menuContainer() {
    return Container(
      width: 360,
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
        alignment: WrapAlignment.center,
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
                //Todo
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
                default:
                  // fallback jika menu tidak ditemukan
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Halaman belum tersedia')),
                  );
              }
            },
            child: SizedBox(
              width: 70,
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
                    style: const TextStyle(fontSize: 12),
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
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
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
                    Container(
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
