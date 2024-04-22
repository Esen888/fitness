import 'package:BodyPower/features/blogger/data/models/list_of_courses_in_section.dart';

abstract class GetListOfCoursesInSectionRepo{
  Future <ListOfCoursesInSectionModel> getListOfCoursesInSections({required int id});
}