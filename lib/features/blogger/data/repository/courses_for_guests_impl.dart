import 'package:fitness/features/blogger/data/models/guest_courses_model.dart';
import 'package:fitness/features/blogger/data/use_cases/courses_for_guests.dart';
import 'package:fitness/features/blogger/domain/repositories/courses_for_guests.dart';

class GetCoursesForGuestRepoImpl implements GetCoursesForGuestRepo {
  GetCoursesForGuestsUseCase useCase;
  GetCoursesForGuestRepoImpl({required this.useCase});
  @override
  Future<CoursesForGuestsModel> getCourses() async {
    return await useCase.getCourses();
  }
}
