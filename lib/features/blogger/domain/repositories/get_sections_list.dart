import 'package:BodyPower/features/blogger/data/models/section_model.dart';

abstract class GetSectionsListRepo{
  Future <SectionsModel> getSectionsList();
}