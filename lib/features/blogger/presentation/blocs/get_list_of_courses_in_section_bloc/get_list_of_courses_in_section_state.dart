part of 'get_list_of_courses_in_section_bloc.dart';

class GetListOfCoursesInSectionState extends Equatable {
  const GetListOfCoursesInSectionState();

  @override
  List<Object> get props => [];
}

class GetListOfCoursesInSectionInitial extends GetListOfCoursesInSectionState {}

class GetListOfCoursesInSectionLoading extends GetListOfCoursesInSectionState {}

class GetListOfCoursesInSectionSuccess extends GetListOfCoursesInSectionState {
  final ListOfCoursesInSectionModel model;
  const GetListOfCoursesInSectionSuccess({required this.model});
}

class GetListOfCoursesInSectionError extends GetListOfCoursesInSectionState {
  final DioException exception;
  const GetListOfCoursesInSectionError({required this.exception});
}
