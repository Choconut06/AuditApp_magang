import 'package:audit_app_magang/pages/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  static List<MainMenuModel> getMainMenu(){
    List<MainMenuModel> mainMenu = [];

    mainMenu.add(
      MainMenuModel(
        name: 'Menu1',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu2',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu3',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu4',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu5',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu6',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu7',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu8',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    return mainMenu;
  }
}

