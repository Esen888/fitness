import 'package:BodyPower/features/user/data/data_sources/get_total_usercources_usecase.dart';
import 'package:BodyPower/features/user/data/models/total_courses_model.dart';
import 'package:BodyPower/features/user/domain/repositories/get_total_usercources.dart';

class TotalUserCoursesRepoImpl implements TotalUserCoursesRepo{
  TotalUserCoursesUseCase useCase;
  TotalUserCoursesRepoImpl({required this.useCase});
  @override
  Future<TotalUserCousesModel> getTotalCourses()async {
    return await useCase.getTotalCourses();
  }
  
}