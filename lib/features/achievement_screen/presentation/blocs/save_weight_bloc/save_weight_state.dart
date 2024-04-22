part of 'save_weight_bloc.dart';

class SaveWeightState extends Equatable {
  const SaveWeightState();

  @override
  List<Object> get props => [];
}

class SaveWeightInitial extends SaveWeightState {}

class SaveWeightLoading extends SaveWeightState {}

class SaveWeightSuccess extends SaveWeightState {}

class SaveWeightError extends SaveWeightState {}
