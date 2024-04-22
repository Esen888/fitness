import 'package:BodyPower/features/blogger/data/models/section_model.dart';
import 'package:BodyPower/features/blogger/data/repository/get_sections_list_repo.dart';
import 'package:BodyPower/features/blogger/domain/repositories/get_sections_list.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_list_of_sections_event.dart';
part 'get_list_of_sections_state.dart';

class GetListOfSectionsBloc
    extends Bloc<GetListOfSectionsEvent, GetListOfSectionsState> {
  GetSectionsListRepoImpl repoImpl;
  GetListOfSectionsBloc({required this.repoImpl})
      : super(GetListOfSectionsInitial()) {
    on<GetListOfSectionsEvent>((event, emit) async {
      emit(GetListOfSectionLoading());
      try {
        final result = await repoImpl.getSectionsList();
        emit(GetListOfSectionsSuccess(model: result));
      } on DioException catch (e) {
        emit(GetListOfSectionsError(exception: e));
      } 
    });
  }
}
