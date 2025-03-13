part of 'cource_bloc.dart';

class CourceState extends Equatable {
  const CourceState();

  @override
  List<Object> get props => [];
}

class CourceInitial extends CourceState {}

class CourceLoading extends CourceState {}

class CourceSuccess extends CourceState {
  final CourseModel model;
  const CourceSuccess({required this.model});
}

class CourceError extends CourceState {
  final String errorText;
  const CourceError({required this.errorText});
}
