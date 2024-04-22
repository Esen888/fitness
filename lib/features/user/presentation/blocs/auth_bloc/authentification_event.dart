part of 'authentification_bloc.dart';

abstract class AuthentificationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class VerifySentOtpEvent extends AuthentificationEvent {
  final String otpCode;
  final String verificationId;

  VerifySentOtpEvent({required this.otpCode, required this.verificationId});

  @override
  List<Object> get props => [otpCode, verificationId];
}

class SendOtpToPhoneEvent extends AuthentificationEvent {
  final String phoneNumber;

  SendOtpToPhoneEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class OnPhoneOtpSent extends AuthentificationEvent {
  final String verificationId;
  final int? token;
  OnPhoneOtpSent({
    required this.verificationId,
    required this.token,
  });

  @override
  List<Object> get props => [verificationId];
}

class OnPhoneAuthErrorEvent extends AuthentificationEvent {
  final String error;
  OnPhoneAuthErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}

class OnPhoneAuthVerificationCompleteEvent extends AuthentificationEvent {
  final AuthCredential credential;
  OnPhoneAuthVerificationCompleteEvent({
    required this.credential,
  });
}

///
///
///
class SignInRequested extends AuthentificationEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

class SignUpRequested extends AuthentificationEvent {
  final String email;
  final String password;

  SignUpRequested(this.email, this.password);
}

class GoogleSignInRequested extends AuthentificationEvent {}

class SignOutRequested extends AuthentificationEvent {}

class AppleSignInRequested extends AuthentificationEvent {}

class DeleteCurrentAccaunt extends AuthentificationEvent {}
