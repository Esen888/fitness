part of 'authorization_bloc.dart';

 class AuthorizationEvent extends Equatable {
  final String phoneNumber;
  const AuthorizationEvent({required this.phoneNumber});

  @override
  List<Object> get props => [];
}
