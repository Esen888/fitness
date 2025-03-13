import 'package:fitness/features/user/data/models/course_model.dart';
import 'package:fitness/features/user/data/repository/course_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cource_event.dart';
part 'cource_state.dart';

class CourceBloc extends Bloc<CourceEvent, CourceState> {
  CourceRepoImpl repoImpl;
  CourceBloc({required this.repoImpl}) : super(CourceInitial()) {
    on<CourceEvent>((event, emit) async {
      emit(CourceLoading());
      try {
        final result = await repoImpl.course(courceId: event.courceId);
        emit(CourceSuccess(model: result));
      } catch (e) {
        emit(CourceError(errorText: e.toString()));
      }
    });
  }
}
