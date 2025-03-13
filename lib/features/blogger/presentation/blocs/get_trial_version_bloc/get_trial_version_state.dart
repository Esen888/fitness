part of 'get_trial_version_bloc.dart';

class GetTrialVersionState extends Equatable {
  const GetTrialVersionState();

  @override
  List<Object> get props => [];
}

class GetTrialVersionInitial extends GetTrialVersionState {}

class GetTrialVersionLoading extends GetTrialVersionState {}

class GetTrialVersionSucces extends GetTrialVersionState {
  
}

class GetTrialVersionError extends GetTrialVersionState {
  final String errorText;
  const GetTrialVersionError({required this.errorText});
}
