import 'package:fitness/features/user/data/data_sources/user_courses_usecase.dart';
import 'package:fitness/features/user/data/models/user_courses_model.dart';
import 'package:fitness/features/user/domain/repositories/user_courses_repo.dart';

class UserCoursesRepoImpl implements UserCoursesRepo {
  UserCourseUseCase useCase;
  UserCoursesRepoImpl({required this.useCase});
  @override
  Future<UserCoursesModel> getUserCourses( {required int sectionId}) async {
    return await useCase.getUserCourses(sectionId: sectionId);
  }
}
