import 'package:BodyPower/features/blogger/data/models/list_of_courses_in_section.dart';
import 'package:BodyPower/features/blogger/data/repository/get_list_of_courses_in_section_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_list_of_courses_in_section_event.dart';
part 'get_list_of_courses_in_section_state.dart';

class GetListOfCoursesInSectionBloc extends Bloc<GetListOfCoursesInSectionEvent,
    GetListOfCoursesInSectionState> {
  GetListOfCoursesInSectionRepoImpl repoImpl;
  GetListOfCoursesInSectionBloc({required this.repoImpl})
      : super(GetListOfCoursesInSectionInitial()) {
    on<GetListOfCoursesInSectionEvent>((event, emit) async {
      emit(GetListOfCoursesInSectionLoading());
      try {
        final result = await repoImpl.getListOfCoursesInSections(id: event.id);
        emit(GetListOfCoursesInSectionSuccess(model: result));
      } on DioException catch (e) {
        emit(GetListOfCoursesInSectionError(exception: e));
      }
    });
  }
}
