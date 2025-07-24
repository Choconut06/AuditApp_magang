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
        name: 'Menu 1',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu 2',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu 3',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu 4',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu 5',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu 6',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu 7',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    mainMenu.add(
      MainMenuModel(
        name: 'Menu 8',
        iconPath: 'assets/icons/pictures.svg',
        boxColor: Colors.blue.shade400
      )
    );

    return mainMenu;
  }
}

