import 'package:BodyPower/features/blogger/data/models/available_courses_model.dart';
import 'package:BodyPower/features/blogger/data/use_cases/get_all_available_courses.dart';
import 'package:BodyPower/features/blogger/domain/repositories/get_list_all_available_course.dart';

class GetAllAvailableCoursesRepoImpl implements GetAllAvailableCoursesRepo{
  GetAllAvailableCoursesUseCase useCase;
  GetAllAvailableCoursesRepoImpl({required this.useCase});
  @override
  Future<AvailableCoursesModel> getAvailableCouser()async {
    return await useCase.getAvailableCourses();
  }
}