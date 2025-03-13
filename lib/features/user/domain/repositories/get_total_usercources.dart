import 'package:fitness/features/user/data/models/total_courses_model.dart';

abstract class TotalUserCoursesRepo{
  Future<TotalUserCousesModel> getTotalCourses();
}