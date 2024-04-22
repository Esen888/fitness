import 'package:BodyPower/features/user/data/models/user_courses_model.dart';
import 'package:BodyPower/features/user/data/repository/user_courses_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_user_courses_event.dart';
part 'get_user_courses_state.dart';

class GetUserCoursesBloc
    extends Bloc<GetUserCoursesEvent, GetUserCoursesState> {
  UserCoursesRepoImpl repoImpl;
  GetUserCoursesBloc({required this.repoImpl})
      : super(GetUserCoursesInitial()) {
    on<GetUserCoursesEvent>((event, emit) async {
      emit(GetUserCoursesLoading());
      try {
        final result =
            await repoImpl.getUserCourses(sectionId: event.sectionId);
        emit(GetUserCoursesSuccess(model: result));
      } on DioException catch (e) {
        if (e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.receiveTimeout) {
          emit(const GetUserCoursesError(
              errorText: "Проверьте интернет подключение"));
        } else {
          emit(const GetUserCoursesError(errorText: "Технические неполадки"));
        }
      }
    });
  }
}
