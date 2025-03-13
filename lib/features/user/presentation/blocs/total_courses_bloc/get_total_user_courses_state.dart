part of 'get_total_user_courses_bloc.dart';

class GetTotalUserCoursesState extends Equatable {
  const GetTotalUserCoursesState();

  @override
  List<Object> get props => [];
}

class GetTotalUserCoursesInitial extends GetTotalUserCoursesState {}

class GetTotalUserCoursesLoading extends GetTotalUserCoursesState {}

class GetTotalUserCoursesSuccess extends GetTotalUserCoursesState {
  final TotalUserCousesModel model;
  const GetTotalUserCoursesSuccess({required this.model});
}

class GetTotalUserCoursesError extends GetTotalUserCoursesState {
  final String errorText; 

  const GetTotalUserCoursesError({required this.errorText});
}
