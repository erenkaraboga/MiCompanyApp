
import 'package:flutter/material.dart';
class DrawerItem{
  late final String descriptiion;
  late final String imagePath;
  late final Color color;
  DrawerItem(this.descriptiion,this.imagePath,this.color);
}
class DrawerItems{
  static  DrawerItem home = DrawerItem("Ana Menü", 'assets/icons/home.png',Colors.black);
  static  DrawerItem aydinlatma = DrawerItem("Cerrahi Aydınlatma", 'assets/icons/lamb.png',Colors.blue);
  static  DrawerItem motor = DrawerItem("Cerrahi Motor Sistemleri", 'assets/icons/drill.png',Colors.green);
  static  DrawerItem konteyner = DrawerItem("Sterilizasyon Konteyer", 'assets/icons/container.png',Colors.cyanAccent);
  static  DrawerItem tek = DrawerItem("Tek Kullanımlık Ürünler", 'assets/icons/mask.png',Colors.orange);
  static final List<DrawerItem> all=[
    home,
    aydinlatma,
    motor,
    konteyner,
    tek,
  ];
}
