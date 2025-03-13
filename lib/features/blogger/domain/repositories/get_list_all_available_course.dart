import 'package:fitness/features/blogger/data/models/available_courses_model.dart';

abstract class GetAllAvailableCoursesRepo{
  Future<AvailableCoursesModel> getAvailableCouser();
}