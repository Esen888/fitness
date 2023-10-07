part of 'user_bloc.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class LogInState extends UserState {
  final String email;
  final String password;

  LogInState(this.email, this.password);
}

class FetchedUserState extends UserState {
  final UserModel user;

  FetchedUserState(this.user);
}

class CreatedUserState extends UserState {}

class UserErrorState extends UserState {
  final String error;

  UserErrorState(this.error);
}
