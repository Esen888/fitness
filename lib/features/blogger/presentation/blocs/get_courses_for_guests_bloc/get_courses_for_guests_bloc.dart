import 'package:fitness/features/blogger/data/models/guest_courses_model.dart';
import 'package:fitness/features/blogger/data/repository/courses_for_guests_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_courses_for_guests_event.dart';
part 'get_courses_for_guests_state.dart';

class GetCoursesForGuestsBloc
    extends Bloc<GetCoursesForGuestsEvent, GetCoursesForGuestsState> {
  GetCoursesForGuestRepoImpl repoImpl;
  GetCoursesForGuestsBloc({required this.repoImpl})
      : super(GetCoursesForGuestsInitial()) {
    on<GetCoursesForGuestsEvent>((event, emit) async {
      emit(GetCoursesForGuestsLoading());
      try {
        final result = await repoImpl.getCourses();
        emit(GetCoursesForGuestsSuccess(model: result));
      } on DioException catch (e) {
        if (e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.receiveTimeout) {
          emit(const GetCoursesForGuestsError(
              errorText:
                  "Проблемы соединения с интернетом, Проверьте интернет подключение."));
        } else {
          emit(const GetCoursesForGuestsError(
              errorText:
                  "Приносим извинения! В данный момент у нас возникли технические неполадки. В скорем времени всё снова заработает."));
        }
      } catch (e) {
        emit(GetCoursesForGuestsError(errorText: e.toString()));
      }
    });
  }
}
