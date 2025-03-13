part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  final String phoneNumber;
  final String codeFromSms;
  const LoginEvent(
      {required this.phoneNumber, required this.codeFromSms});

  @override
  List<Object> get props => [];
}
