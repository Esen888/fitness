import 'package:BodyPower/features/user/data/models/user_courses_model.dart';

abstract class UserCoursesRepo {
  Future<UserCoursesModel> getUserCourses({required int sectionId});
}
