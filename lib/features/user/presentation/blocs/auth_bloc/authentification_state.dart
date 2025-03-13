part of 'authentification_bloc.dart';

abstract class AuthentificationState {}

class AuthentificationInitial extends AuthentificationState {}

class AuthLoadingState extends AuthentificationState {
  List<Object?> get props => [];
}

class Authenticated extends AuthentificationState {
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthentificationState {
  List<Object?> get props => [];
}

class AuthError extends AuthentificationState {
  final String error;
  AuthError({required this.error});
  List<Object> get props => [error];
}

class PhoneAuthVerified extends AuthentificationState {}

class PhoneAuthCodeSentSuccess extends AuthentificationState {
  final String verificationId;
  PhoneAuthCodeSentSuccess({
    required this.verificationId,
  });
  List<Object> get props => [verificationId];
}
