import 'package:audit_app_magang/pages/LHPpage.dart';
import 'package:audit_app_magang/pages/ba_penyelesaianpage.dart';
import 'package:audit_app_magang/pages/biaya_penugasanpage.dart';
import 'package:audit_app_magang/pages/closing_meetingpage.dart';
import 'package:audit_app_magang/pages/dokumen_pkatpage.dart';
import 'package:audit_app_magang/pages/draft_lhapage.dart';
import 'package:audit_app_magang/pages/executive_summarypage.dart';
import 'package:audit_app_magang/pages/homepage.dart';
import 'package:audit_app_magang/pages/memo_tindak_lanjutpage.dart';
import 'package:audit_app_magang/pages/opening_meetingpage.dart';
import 'package:audit_app_magang/pages/pemenuhan_dokumenpage.dart';
import 'package:audit_app_magang/pages/permintaan_dokumenpage.dart';
import 'package:audit_app_magang/pages/pkatpage.dart';
import 'package:audit_app_magang/pages/program__auditpage.dart';
import 'package:audit_app_magang/pages/realisasi_biayapage.dart';
import 'package:audit_app_magang/pages/rencana_biayapage.dart';
import 'package:audit_app_magang/pages/review_draft_lhapage.dart';
import 'package:audit_app_magang/pages/review_tindak_lanjutpage.dart';
import 'package:audit_app_magang/pages/surat_kesediaanpage.dart';
import 'package:audit_app_magang/pages/surat_pemberitahuanpage.dart';
import 'package:audit_app_magang/pages/komitmenpage.dart';
import 'package:audit_app_magang/pages/login.dart';
import 'package:audit_app_magang/pages/risk_assessment.dart';
import 'package:audit_app_magang/pages/tanggapanpage.dart';
import 'package:audit_app_magang/pages/temuanpage.dart';
import 'package:audit_app_magang/pages/tindak_lanjut_temuanpage.dart';
import 'package:audit_app_magang/pages/undangan_closingpage.dart';
import 'package:audit_app_magang/pages/undangan_openingpage.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home', style: TextStyle(
                fontWeight: FontWeight.w600
              ),),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shield),
              title: const Text('Penilaian Resiko', style: TextStyle(
                fontWeight: FontWeight.w600
              ),),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiskAssessmentPage(),
                  ),
                );
              },
            ),
            // Tile Program Kerja
            ExpansionTile(
              leading: const Icon(Icons.folder),
              title: const Text("Program Kerja", style: TextStyle(
                fontWeight: FontWeight.w600
              ),),
              children: [
                ListTile(
                  title: const Text('         PKAT'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const PkatPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Rencana Biaya'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RencanaBiayaPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Dokumen PKAT'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DokumenPkatPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Persiapan Audit
            ExpansionTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text("Persiapan Audit", style: TextStyle(
                fontWeight: FontWeight.w600
              ),),
              children: [
                ListTile(
                  title: const Text('         Surat Pemberitahuan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuratPemberitahuanPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Program Audit'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProgramAuditPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Biaya Penugasan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BiayaPenugasanPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Pelaksanaan Audit
            ExpansionTile(
              leading: const Icon(Icons.ballot),
              title: const Text(
                "Pelaksanaan Audit",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              children: [
                ListTile(
                  title: const Text('         Undangan Opening'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UndanganOpeningPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Opening Meeting'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OpeningMeetingPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Permintaan Dokumen'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PermintaanDokumenPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Pemenuhan Dokumen'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PemenuhanDokumenPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Draft LHA'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DraftLHAPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Review Draft LHA'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReviewDraftLHAPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Tanggapan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TanggapanPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Temuan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TemuanPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Undangan Closing'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UndanganClosingPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Closing Meeting'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClosingMeetingPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Komitmen'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KomitmenPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Pelaporan Audit
            ExpansionTile(
              leading: const Icon(Icons.ballot),
              title: const Text(
                "Pelaporan Audit",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              children: [
                ListTile(
                  title: const Text('         Surat Kesediaan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuratKesediaanPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Executive Summary'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExecutiverSummaryPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         LHP'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LHPPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Realisasi Biaya'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RealisasiBiayaPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Tindak Lanjut Audit
            ExpansionTile(
              leading: const Icon(Icons.ballot),
              title: const Text(
                "Tindak Lanjut Audit",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              children: [
                ListTile(
                  title: const Text('         Memo Tindak Lanjut'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MemoTindakLanjutPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Tindak Lanjut Temuan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TindakLanjutTemuanPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Review Tindak Lanjut'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReviewTindakLanjutPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         BA Penyelesaian'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BAPenyelesaianPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            //Tile Penilaian Kinerja
            ListTile(
              leading: const Icon(Icons.checklist_rounded),
              title: const Text('Penilaian Kinerja', style: TextStyle(
                fontWeight: FontWeight.w600
              ),),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()) 
                );
              },
            ),
            // Tile Survey Kepuasan Audit
            ExpansionTile(
              leading: const Icon(Icons.grading_sharp),
              title: const Text(
                "Survey Kepuasan Audit",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              children: [
                ListTile(
                  title: const Text('         Pengiriman'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UndanganOpeningPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Pengisian'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OpeningMeetingPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Hasil Survey'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PermintaanDokumenPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Investigasi
            ExpansionTile(
              leading: const Icon(Icons.search),
              title: const Text(
                "Investigasi",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              children: [
                ListTile(
                  title: const Text('         Bukti Permulaan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UndanganOpeningPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Instruksi Audit'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OpeningMeetingPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Surat Pemanggilan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PermintaanDokumenPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Pemeriksaan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PemenuhanDokumenPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Audit Eksternal
            ExpansionTile(
              leading: const Icon(Icons.list),
              title: const Text(
                "Audit Eksternal",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              children: [
                ListTile(
                  title: const Text('         Register'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UndanganOpeningPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Tindak Lanjut'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OpeningMeetingPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Konsultasi
            ExpansionTile(
              leading: const Icon(Icons.group),
              title: const Text(
                "Konsultasi",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              children: [
                ListTile(
                  title: const Text('         FOrm Konsultasi'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UndanganOpeningPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Realisasi'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OpeningMeetingPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Tanya Jawab'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PermintaanDokumenPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Pelatihan Auditor
            ExpansionTile(
              leading: const Icon(Icons.candlestick_chart_rounded),
              title: const Text(
                "Pelatihan Auditor",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              children: [
                ListTile(
                  title: const Text('         Perencanaan'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UndanganOpeningPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Realisasi'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OpeningMeetingPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Tile Rapat Umum
            ExpansionTile(
              leading: const Icon(Icons.handyman),
              title: const Text(
                "Rapat Umum",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              children: [
                ListTile(
                  title: const Text('         Undangan Rapat'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UndanganOpeningPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('         Risalah Rapat'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OpeningMeetingPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout', style: TextStyle(
                fontWeight: FontWeight.w600
              ),),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
