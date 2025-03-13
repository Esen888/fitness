import 'package:fitness/features/user/data/models/total_courses_model.dart';
import 'package:fitness/features/user/data/repository/get_total_usercourses_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_total_user_courses_event.dart';
part 'get_total_user_courses_state.dart';

class GetTotalUserCoursesBloc
    extends Bloc<GetTotalUserCoursesEvent, GetTotalUserCoursesState> {
  TotalUserCoursesRepoImpl repoImpl;

  GetTotalUserCoursesBloc({required this.repoImpl})
      : super(GetTotalUserCoursesInitial()) {
    on<GetTotalUserCoursesEvent>((event, emit) async {
      emit(GetTotalUserCoursesLoading());
      try {
        final TotalUserCousesModel result = await repoImpl.getTotalCourses();
        emit(GetTotalUserCoursesSuccess(model: result));
      } catch (_) {
        emit(const GetTotalUserCoursesError(
            errorText: "Не удалось получить данные"));
      }
    });
  }
}
