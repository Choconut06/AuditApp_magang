import 'package:flutter/material.dart';
import 'package:audit_app_magang/pages/risk_assessment.dart';
import 'package:audit_app_magang/pages/pkatpage.dart';
import 'package:audit_app_magang/pages/dokumen_pkatpage.dart';
import 'package:audit_app_magang/pages/surat_pemberitahuanpage.dart';
import 'package:audit_app_magang/pages/program__auditpage.dart';
import 'package:audit_app_magang/pages/biaya_penugasanpage.dart';

class MainMenuModel {
  String name;
  String iconPath;
  Color boxColor;

  MainMenuModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  //list sementara hardcode next nya akan dibuat menggunakan database
  static List<MainMenuModel> getMainMenu() {
    List<MainMenuModel> mainMenu = [];

    mainMenu.add(
      MainMenuModel(
        name: 'Penilaian Risiko',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    mainMenu.add(
      MainMenuModel(
        name: 'PKAT',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Rencana Biaya',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Dokumen PKAT',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Surat Pemberitahuan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Program Audit',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Biaya Penugasan',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400,
      ),
    );
    return mainMenu;
  }
}
