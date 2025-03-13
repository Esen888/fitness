import 'package:fitness/features/blogger/data/models/section_model.dart';

abstract class GetSectionsListRepo{
  Future <SectionsModel> getSectionsList();
}