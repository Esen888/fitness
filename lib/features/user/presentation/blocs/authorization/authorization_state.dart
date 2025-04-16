part of 'authorization_bloc.dart';

class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

class AuthorizationInitial extends AuthorizationState {}

class AuthorizationLoading extends AuthorizationState {}

class AuthorizationSuccess extends AuthorizationState {
  // final int smsCode;
  const AuthorizationSuccess(
    // {required this.smsCode}
  );
}

class AuthorizationError extends AuthorizationState {
  final String errorText;
 const  AuthorizationError({required this.errorText});
}
