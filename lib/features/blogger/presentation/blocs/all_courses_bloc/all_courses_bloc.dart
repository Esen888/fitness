import 'package:BodyPower/features/blogger/data/models/available_courses_model.dart';
import 'package:BodyPower/features/blogger/data/repository/get_list_all_availablecourses_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'all_courses_event.dart';
part 'all_courses_state.dart';

class AllCoursesBloc extends Bloc<AllCoursesEvent, AllCoursesState> {
  GetAllAvailableCoursesRepoImpl repoImpl;
  AllCoursesBloc({required this.repoImpl}) : super(AllCoursesInitial()) {
    on<AllCoursesEvent>((event, emit) async {
      emit(AllCoursesLoading());
      try {
        final result = await repoImpl.getAvailableCouser();
        emit(AllCoursesSuccess(model: result));
      } on DioException catch (e) {
        emit(AllCoursesError(exception: e));
      }
    });
  }
}
