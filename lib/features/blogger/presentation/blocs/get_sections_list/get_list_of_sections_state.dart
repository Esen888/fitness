part of 'get_list_of_sections_bloc.dart';

class GetListOfSectionsState extends Equatable {
  const GetListOfSectionsState();

  @override
  List<Object> get props => [];
}

class GetListOfSectionsInitial extends GetListOfSectionsState {}

class GetListOfSectionLoading extends GetListOfSectionsState {}

class GetListOfSectionsSuccess extends GetListOfSectionsState {
  final SectionsModel model;
  const GetListOfSectionsSuccess({required this.model});
}

class GetListOfSectionsError extends GetListOfSectionsState {
  final DioException exception;
  const GetListOfSectionsError({required this.exception});
}
