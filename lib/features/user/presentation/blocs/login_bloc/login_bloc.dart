import 'package:fitness/features/user/data/models/login_model.dart';
import 'package:fitness/features/user/data/repository/login_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepositoryImpl repositoryImpl;
  LoginBloc({required this.repositoryImpl}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final result = await repositoryImpl.login(
            phoneNumber: event.phoneNumber, smsCode: int.parse(event.codeFromSms));
        emit(LoginSuccess(model: result));
      } catch (e) {
        emit(LoginError(errorText: e.toString()));
      }
    });
  }
}
