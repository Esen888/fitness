part of 'user_info_bloc.dart';

class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoSuccess extends UserInfoState {
  final UserProfileModel model;
  const UserInfoSuccess({required this.model});
}

class UserInfoError extends UserInfoState {
  final DioException exception;
  const UserInfoError({required this.exception});
}
