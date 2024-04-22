import 'package:BodyPower/features/user/data/repository/logout_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'log_out_event.dart';
part 'log_out_state.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  LogOutRepoImpl repoImpl;

  LogOutBloc({required this.repoImpl}) : super(LogOutInitial()) {
    on<LogOutEvent>((event, emit) async {
      emit(LogOutLoading());
      try {
        await repoImpl.logOut();
        emit(LogOutSuccess());
      } catch (_) {
        emit(LogOutError());
      }
    });
  }
}
