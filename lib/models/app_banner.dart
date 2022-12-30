import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppBanner {
  final int? id;
  final String? title;
  final String? subTitle;
  final String? image;
  final Color? color;

  AppBanner( {
    this.id,
    this.title,
    this.subTitle,
    this.image,
    this.color,
  });
}

// sample data
List<AppBanner> appbannerList = [
  AppBanner(
      id: 1, title: 'Супер нархларда', subTitle: 'Мевалар уруғини сотиб олинг', color: Colors.blue),
  AppBanner(
      id: 2, title: 'Супер нархларда', subTitle: 'Мевалар уруғини сотиб олинг' ,color: Colors.pink),
  AppBanner(
      id: 3, title: 'Супер нархларда', subTitle: 'Мевалар уруғини сотиб олинг',  color: Colors.redAccent),
  AppBanner(
      id: 4, title: 'Супер нархларда', subTitle: 'Мевалар уруғини сотиб олинг', color: Colors.greenAccent),
];
