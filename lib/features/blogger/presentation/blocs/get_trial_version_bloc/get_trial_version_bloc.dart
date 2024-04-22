import 'package:BodyPower/features/blogger/data/repository/get_trial_version_impl.dart';
import 'package:bloc/bloc.dart';
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
      } catch (_) {
        GetTrialVersionError();
      }
    });
  }
}
