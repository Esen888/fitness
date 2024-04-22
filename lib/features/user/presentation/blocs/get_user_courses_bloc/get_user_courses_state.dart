part of 'get_user_courses_bloc.dart';

class GetUserCoursesState extends Equatable {
  const GetUserCoursesState();

  @override
  List<Object> get props => [];
}

class GetUserCoursesInitial extends GetUserCoursesState {}

class GetUserCoursesLoading extends GetUserCoursesState {}

class GetUserCoursesSuccess extends GetUserCoursesState {
  final UserCoursesModel model;
  const GetUserCoursesSuccess({required this.model});
}

class GetUserCoursesError extends GetUserCoursesState {
  final String errorText;
  const GetUserCoursesError({required this.errorText});
}
