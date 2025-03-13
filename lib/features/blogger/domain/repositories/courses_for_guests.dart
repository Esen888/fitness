import 'package:fitness/features/blogger/data/models/guest_courses_model.dart';

abstract class GetCoursesForGuestRepo {
  Future<CoursesForGuestsModel> getCourses();
}
