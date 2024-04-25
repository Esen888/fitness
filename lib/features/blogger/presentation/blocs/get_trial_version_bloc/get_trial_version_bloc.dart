import 'package:BodyPower/features/blogger/data/repository/get_trial_version_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_trial_version_event.dart';
part 'get_trial_version_state.dart';

class GetTrialVersionBloc
    extends Bloc<GetTrialVersionEvent, GetTrialVersionState> {
  GetTrialVersionRepoImpl repoImpl;

  GetTrialVersionBloc({required this.repoImpl})
      : super(GetTrialVersionInitial()) {
    on<GetTrialVersionEvent>((event, emit) async {
      emit(GetTrialVersionLoading());
      try {
        await repoImpl.getTrialVersion(courseId: event.courseId);
        emit(GetTrialVersionSucces());
      } on DioException catch (e) {
        if (e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.receiveTimeout) {
          emit(const GetTrialVersionError(
              errorText:
                  "Проблемы соединения с интернетом, Проверьте интернет подключение."));
        } else if (e.type == DioExceptionType.badResponse) {
          emit(const GetTrialVersionError(
              errorText: "Войдите в систему, чтобы получить доступ к курсу"));
        } else {
          emit(const GetTrialVersionError(
              errorText:
                  "Приносим извинения! В данный момент у нас возникли технические неполадки. В скорем времени всё снова заработает."));
        }
      } catch (e) {
        emit(GetTrialVersionError(errorText: e.toString()));
      }
    });
  }
}
