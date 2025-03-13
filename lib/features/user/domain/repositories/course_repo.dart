import 'package:fitness/features/user/data/models/course_model.dart';

abstract class CourceRepo{
  Future<CourseModel> course({required int courceId});
}