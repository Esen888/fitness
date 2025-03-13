part of 'buy_course_bloc.dart';

class BuyCourseState extends Equatable {
  const BuyCourseState();

  @override
  List<Object> get props => [];
}

class BuyCourseInitial extends BuyCourseState {}

class BuyCourseLoading extends BuyCourseState {}

class BuyCourseSuccess extends BuyCourseState {
  final PaymentModel model;
  const BuyCourseSuccess({required this.model});
}

class BuyCourseError extends BuyCourseState {
  final String errorText;
  const BuyCourseError({required this.errorText});
}
