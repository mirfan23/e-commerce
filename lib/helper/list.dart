// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../app/modules/home/widget/category_chip.dart';

class MyList {
  static List film = [
    AssetImage("assets/images/conjuring3.jpg"),
    AssetImage("assets/images/ff9.jpg"),
    AssetImage("assets/images/star_wars.jpg"),
    AssetImage("assets/images/monalisa.jpg"),
    AssetImage("assets/images/conjuring3.jpg"),
    AssetImage("assets/images/ff9.jpg"),
    AssetImage("assets/images/star_wars.jpg"),
    AssetImage("assets/images/monalisa.jpg")
  ];

  static List<AssetImage> icon = [
    AssetImage("assets/icons/home2.png"),
    AssetImage("assets/icons/ticket.png"),
    AssetImage("assets/icons/building.png"),
  ];

  static List<String> NamaFilm = [
    "The Conjuring",
    "Fast & Furious 9",
    "Star Wars : The Last Jedi",
    "Monalisa",
    "The Conjuring",
    "Fast & Furious 9",
    "Star Wars : The Last Jedi",
    "Monalisa"
  ];

  // static List<CategoryChip> categories = [
  //   CategoryChip(
  //       categoryName: 'Category 1',
  //       categoryIcon: Icons.category,
  //       categoryColor: Colors.blue),
  //   CategoryChip(
  //       categoryName: 'Category 2',
  //       categoryIcon: Icons.category,
  //       categoryColor: Colors.green),
  //   CategoryChip(
  //       categoryName: 'Category 3',
  //       categoryIcon: Icons.category,
  //       categoryColor: Colors.orange),
  //   CategoryChip(
  //       categoryName: 'Category 4',
  //       categoryIcon: Icons.category,
  //       categoryColor: Colors.red),
  // ];
}
