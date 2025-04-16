import 'package:fitness/features/user/data/repository/authorization_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationRepoImpl repoImpl;
  AuthorizationBloc({required this.repoImpl}) : super(AuthorizationInitial()) {
    on<AuthorizationEvent>((event, emit) async {
      emit(AuthorizationLoading());
      try {
        // final result = 
        await repoImpl.authorizationWithPhone(
            phoneNumber: event.phoneNumber);
        emit(AuthorizationSuccess(
          // smsCode: result
          ));
      } on DioException catch (e) {
        if (e.type == DioExceptionType.sendTimeout) {
          emit(const AuthorizationError(
              errorText: "Проверьте интернет подключение"));
        } else if (e.type == DioExceptionType.connectionError) {
          emit(const AuthorizationError(
              errorText: "Проверьте интернет подключение"));
        } else if (e.type == DioExceptionType.receiveTimeout) {
          emit(const AuthorizationError(
              errorText: "Проверьте интернет подключение"));
        }
      } catch (e) {
        emit(const AuthorizationError(
            errorText: "Что то пошло не так, попробуйте снова"));
      }
    });
  }
}
