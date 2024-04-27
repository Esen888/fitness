import 'package:flutter/cupertino.dart';

class DefaultCourseIndexProvider extends ChangeNotifier {
  int myCoursesId = 1;
  void changeIndex({required int index}) {
    myCoursesId = index;
    notifyListeners();
  }

  int changeSectionId({required int id}) {
    int selectedSectionId;

    selectedSectionId = id;
    notifyListeners();
    return selectedSectionId;
  }
}
