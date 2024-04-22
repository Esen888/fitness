part of 'all_courses_bloc.dart';

class AllCoursesState extends Equatable {
  const AllCoursesState();

  @override
  List<Object> get props => [];
}

class AllCoursesInitial extends AllCoursesState {}

class AllCoursesLoading extends AllCoursesState {}

class AllCoursesSuccess extends AllCoursesState {
  final AvailableCoursesModel model;
  const AllCoursesSuccess({required this.model});
}

class AllCoursesError extends AllCoursesState {
  final DioException exception;
  const AllCoursesError({required this.exception});
}
