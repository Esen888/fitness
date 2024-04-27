import 'package:flutter/material.dart';

abstract class TabsService {
  static const List<Widget> tabs = <Widget>[
    Tab(
      text: "Пн",
    ),
    Tab(
      text: "Вт",
    ),
    Tab(
      text: "Ср",
    ),
    Tab(
      text: "Чт",
    ),
    Tab(
      text: "Пт",
    ),
    Tab(
      text: "Сб",
    ),
    Tab(
      text: "Вс",
    ),
  ];
}
