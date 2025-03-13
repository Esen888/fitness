part of 'get_courses_for_guests_bloc.dart';

class GetCoursesForGuestsState extends Equatable {
  const GetCoursesForGuestsState();

  @override
  List<Object> get props => [];
}

class GetCoursesForGuestsInitial extends GetCoursesForGuestsState {}

class GetCoursesForGuestsLoading extends GetCoursesForGuestsState {}

class GetCoursesForGuestsSuccess extends GetCoursesForGuestsState {
  final CoursesForGuestsModel model;
  const GetCoursesForGuestsSuccess({required this.model});
}

class GetCoursesForGuestsError extends GetCoursesForGuestsState {
  final String errorText;
  const GetCoursesForGuestsError({required this.errorText});
}
