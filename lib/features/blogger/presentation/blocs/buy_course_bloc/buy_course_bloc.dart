import 'package:fitness/features/blogger/data/models/payment_model.dart';
import 'package:fitness/features/blogger/data/repository/buy_course_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'buy_course_event.dart';
part 'buy_course_state.dart';

class BuyCourseBloc extends Bloc<BuyCourseEvent, BuyCourseState> {
  BuyCourseRepoImpl repoImpl;
  BuyCourseBloc({required this.repoImpl}) : super(BuyCourseInitial()) {
    on<BuyCourseEvent>((event, emit) async {
      emit(BuyCourseLoading());
      try {
        final result = await repoImpl.buyCourse(courseID: event.courseId);

        emit(BuyCourseSuccess(model: result));
      } on DioException catch (e) {
        if (e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.receiveTimeout) {
          emit(const BuyCourseError(
              errorText:
                  "Проблемы соединения с интернетом, Проверьте интернет подключение."));
        } else if (e.type == DioExceptionType.badResponse) {
          emit(const BuyCourseError(
              errorText:
                  "Войдите в систему, чтобы получить доступ к курсу"));
        } else {
          emit(const BuyCourseError(
              errorText:
                  "Приносим извинения! В данный момент у нас возникли технические неполадки. В скорем времени всё снова заработает."));
        }
      } catch (e) {
        emit(BuyCourseError(errorText: e.toString()));
      }
    });
  }
}
