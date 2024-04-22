part of 'get_weights_bloc.dart';

class GetWeightsState extends Equatable {
  const GetWeightsState();

  @override
  List<Object> get props => [];
}

class GetWeightsInitial extends GetWeightsState {}

class GetWeightsLoading extends GetWeightsState {}

class GetWeightsSuccess extends GetWeightsState {
  final WeightsModel model;
  const GetWeightsSuccess({required this.model});
}

class GetWeightsError extends GetWeightsState {
  final DioException exception;
  const GetWeightsError({required this.exception});
}
