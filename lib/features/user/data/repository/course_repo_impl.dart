import 'package:fitness/features/user/data/data_sources/courses_usecase.dart';
import 'package:fitness/features/user/data/models/course_model.dart';
import 'package:fitness/features/user/domain/repositories/course_repo.dart';

class CourceRepoImpl implements CourceRepo {
  CoursesUseCase useCase;
  CourceRepoImpl({required this.useCase});
  @override
  Future<CourseModel> course({required int courceId}) async {
    return await useCase.course(courseId: courceId);
  }
}
