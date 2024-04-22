import 'package:BodyPower/features/blogger/data/models/list_of_courses_in_section.dart';
import 'package:BodyPower/features/blogger/data/use_cases/get_list_of_courses_in_section_usecase.dart';
import 'package:BodyPower/features/blogger/domain/repositories/get_list_of_courses_in_section.dart';

class GetListOfCoursesInSectionRepoImpl implements GetListOfCoursesInSectionRepo{
  GetListOfCoursesInSectionUseCase useCase;
  GetListOfCoursesInSectionRepoImpl({required this.useCase});
  @override
  Future<ListOfCoursesInSectionModel> getListOfCoursesInSections({required int id}) async{
    return await useCase.getListOfCousesInSection(id: id);
  }
  
}