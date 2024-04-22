import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeGenderProvider extends ChangeNotifier {
  final SharedPreferences prefs;

  ChangeGenderProvider({required this.prefs});
  String gender = "Общие";
  void changeGender({required String result}) {
    gender = result;
    prefs.getString(result);
    notifyListeners();
  }
}
