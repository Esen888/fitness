part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel model;
 const LoginSuccess({required this.model});
}

class LoginError extends LoginState {
  final String errorText;
 const  LoginError({required this.errorText});
}
