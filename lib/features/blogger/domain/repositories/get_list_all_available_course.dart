import 'package:BodyPower/features/blogger/data/models/available_courses_model.dart';

abstract class GetAllAvailableCoursesRepo{
  Future<AvailableCoursesModel> getAvailableCouser();
}