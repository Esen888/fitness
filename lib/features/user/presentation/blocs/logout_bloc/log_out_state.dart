part of 'log_out_bloc.dart';

class LogOutState extends Equatable {
  const LogOutState();

  @override
  List<Object> get props => [];
}

class LogOutInitial extends LogOutState {}

class LogOutLoading extends LogOutState {}

class LogOutSuccess extends LogOutState {}

class LogOutError extends LogOutState {}
