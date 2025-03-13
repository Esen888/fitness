import 'package:fitness/features/blogger/data/models/section_model.dart';
import 'package:fitness/features/blogger/data/use_cases/get_sections_list_usecase.dart';
import 'package:fitness/features/blogger/domain/repositories/get_sections_list.dart';

class GetSectionsListRepoImpl implements GetSectionsListRepo{
  GetSectionsListUseCase useCase;
  GetSectionsListRepoImpl({required this.useCase});
  @override
  Future<SectionsModel> getSectionsList()async {
      return await useCase.getSectionsList();
  }
  
}